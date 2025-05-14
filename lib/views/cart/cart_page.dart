import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Product 1',
      'price': 50.0,
      'quantity': 1,
    },
    {
      'name': 'Product 2',
      'price': 30.0,
      'quantity': 2,
    },
  ];

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,
              padding: const EdgeInsets.all(12),
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('₹${item['price']}', style: TextStyle(color: Colors.grey[700])),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (item['quantity'] > 1) {
                              item['quantity']--;
                            }
                          });
                        },
                      ),
                      Text('${item['quantity']}', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () => setState(() => item['quantity']++),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('₹$totalAmount',
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('Submit Order', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
