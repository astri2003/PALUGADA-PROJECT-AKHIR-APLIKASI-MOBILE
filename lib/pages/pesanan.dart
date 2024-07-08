import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'My Bookings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          buildBookingSection('Electrical', [
            buildBookingCard(
              status: 'JOB COMPLETED',
              statusColor: Color.fromARGB(255, 173, 142, 211),
              title: 'Perbaikan listrk',
              date: 'Mon, Oct 02, 2024 at 10:00 AM',
              amount: '\Rp70.000',
              name: 'leo Dcarpio',
              imageAsset: 'assets/icons/leo.png',
              onTap: () {},
            ),
            buildBookingCard(
              status: 'JOB COMPLETED',
              statusColor: Color.fromARGB(255, 173, 142, 211),
              title: 'Perbaikan AC',
              date: 'Mon, Oct 02, 2024 at 10:00 AM',
              amount: '\Rp80.000',
              name: 'Tom Holland',
              imageAsset: 'assets/icons/tom.png',
              onTap: () {},
            ),
          ]),
          buildBookingSection('Vehicles Repairman', [
            buildBookingCard(
              status: 'JOB COMPLETED',
              statusColor: Color.fromARGB(255, 173, 142, 211),
              title: 'Perbaikan mesin mobil Rush',
              date: 'Mon, Oct 02, 2024 at 10:00 AM',
              amount: '\Rp70.000',
              name: 'Zayn Malik',
              imageAsset: 'assets/icons/zayn.png',
              onTap: () {},
            ),
          ]),
        ],
      ),
    );
  }

  Widget buildBookingSection(String title, List<Widget> bookings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          children: bookings,
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildBookingCard({
    required String status,
    required Color statusColor,
    required String title,
    required String date,
    required String amount,
    required String name,
    required String imageAsset,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: statusColor),
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  imageAsset,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8),
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount Paid $amount'),
                TextButton(
                  onPressed: onTap,
                  child: Text('Book Again'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
