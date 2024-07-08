import 'package:flutter/material.dart';
import 'package:palugada/child/date_time.dart';

class BookingSummaryPage extends StatelessWidget {
  final String serviceName;
  final String serviceImage;
  final double price;
  final double discount;
  final int quantity;
  final String serviceProviderName;

  BookingSummaryPage({
    required this.serviceName,
    required this.serviceImage,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.serviceProviderName,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = price * quantity;
    double discountedPrice = totalPrice - (totalPrice * (discount / 100));
    double deliveryFee = 0; // Assume delivery fee is free
    double grandTotal = discountedPrice + deliveryFee;

    String address = "Jl. Raya Ciputat Parung"; // Example address

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  serviceImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serviceName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'by Han Son Hee',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Quantity:', style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Text(
                  '${quantity.toString()}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item Total'),
                Text(
                  '\Rp${totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount'),
                Text('- ${discount.toStringAsFixed(0)}%'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Fee'),
                Text('Free'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\Rp${grandTotal.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_pin),
                SizedBox(width: 8),
                Text(address),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('Change'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DateTimeSelectionPage()),
                );
              },
              child: Text(
                'Select Slot',
                style: TextStyle(
                    color: Colors.white), // Ubah warna teks menjadi putih
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Color.fromARGB(255, 104, 55, 161),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
