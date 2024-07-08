import 'package:flutter/material.dart';
import 'package:palugada/child/payment.dart';

class AddressSelectionPage extends StatefulWidget {
  @override
  _AddressSelectionPageState createState() => _AddressSelectionPageState();
}

class _AddressSelectionPageState extends State<AddressSelectionPage> {
  int selectedAddressIndex = 0;

  get addresses => null;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> addresses = [
      {'title': 'Home', 'address': 'No.25 gg.bahagia.\nJln Sutomo, Medan'},
      {
        'title': 'Work',
        'address': 'No 12 Komplek Cemara Garde .\nJln. Cemara, Deli serdang'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(addresses[index]['title']!),
                    subtitle: Text(addresses[index]['address']!),
                    leading: Radio(
                      value: index,
                      groupValue: selectedAddressIndex,
                      onChanged: (int? value) {
                        setState(() {
                          selectedAddressIndex = value!;
                        });
                      },
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'add') {
                          _showAddAddressDialog();
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return {'Add New Address'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: 'add',
                            child: Text(choice),
                          );
                        }).toList();
                      },
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentMethodPage(),
                  ),
                );
              },
              child: Text('Confirm Address',
                  style: TextStyle(color: Colors.white)),
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

  void _showAddAddressDialog() {
    TextEditingController addressController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Address'),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(hintText: "Enter new address"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  addresses.add({
                    'title': 'New Address',
                    'address': addressController.text,
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
