import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Debit or Credit Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/icons/Mastercard.png', width: 32),
                title: Text('Master Card'),
                subtitle: Text('4897 4700 2589 9658'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AddNewCardForm(),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label:
                  Text('Add New Card', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                backgroundColor: Color.fromARGB(255, 75, 23, 172),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'e-Wallet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Image.asset('assets/icons/GoPay.png', width: 52),
              title: Text('Gopay'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Image.asset('assets/icons/DANA.png', width: 52),
              title: Text('Dana'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 16),
            Text(
              'UPI',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Image.asset('assets/icons/GooglePay.png', width: 52),
              title: Text('Google Pay'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Image.asset('assets/icons/apple.png', width: 54),
              title: Text('Apple Pay'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 16),
            Text(
              'Pay After Service',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Image.asset('assets/icons/cash.png', width: 50),
              title: Text('Pay With Cash After Service'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 32), // Add space before the Pay button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Payment Succeed'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle,
                                color: Colors.green, size: 50),
                            SizedBox(height: 16),
                            Text('Your payment was successful!'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Bayar', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Color.fromARGB(255, 71, 15, 149),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddNewCardForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add New Card',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Card Holder Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Add Card', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              backgroundColor: Color.fromARGB(255, 87, 15, 188),
            ),
          ),
        ],
      ),
    );
  }
}
