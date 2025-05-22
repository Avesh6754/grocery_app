import 'package:flutter/material.dart';
import 'package:grocery_app/views/cart/cart_page.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';
import '../modal/product_modal.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  String selectedLanguage = 'english'; // Default language
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.fetchData(selectedLanguage);
  }

  void showProductDialog(Product product) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(product.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(product.img, height: 120), // Assuming asset image
            const SizedBox(height: 10),
            Text("Price: ₹${product.price}"),
            const SizedBox(height: 10),
            Text(product.description),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: Column(
        children: [
          // 🔽 Language Selection
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                    homeProvider.fetchData(value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'english', child: Text("English")),
                    const PopupMenuItem(value: 'hindi', child: Text("Hindi")),
                    const PopupMenuItem(value: 'gujarati', child: Text("Gujarati")),
                  ],
                  icon: const Icon(Icons.language, color: Colors.green),
                ),
              ],
            ),
          ),

          // 🔍 Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search groceries...',
                prefixIcon: Icon(Icons.search, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green.shade500),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          const SizedBox(height: 10),

          // 🛒 Product List
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (context, provider, child) {
                List<Product> products = provider.filterProductList;

                // Apply search
                if (searchQuery.isNotEmpty) {
                  products = products
                      .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
                      .toList();
                }

                if (products.isEmpty) {
                  return const Center(child: Text("No products found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 4,
                      color: Colors.white,
                      child: ListTile(
                        onTap: () => showProductDialog(product),
                        contentPadding: const EdgeInsets.all(12),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.img,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('₹${product.price}',
                                style: TextStyle(color: Colors.green.shade500)),
                            const SizedBox(height: 4),
                            Text(
                              product.description,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            provider.addToCart(product); // Optional: Only if you manage cart list
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => CartPage()),
                            );
                          },
                          child: const Text("Add to Cart"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                        ),

                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
