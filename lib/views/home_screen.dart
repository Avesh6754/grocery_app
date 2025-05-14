import 'package:flutter/material.dart';
import 'package:grocery_app/views/cart/cart_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = List.generate(
    10,
    (index) => {
      'name': 'Product ${index + 1}',
      'price': (10 + index * 5).toDouble(),
      'description': 'This is a description for Product', // Added a description
    },
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage(),));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade200,
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                      title: Text(
                        product['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹${product['price']}',
                            style: TextStyle(color: Colors.green.shade500),
                          ),
                          SizedBox(height: 4),
                          Text(
                            product['description'], // Display the description
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.green.shade700),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
