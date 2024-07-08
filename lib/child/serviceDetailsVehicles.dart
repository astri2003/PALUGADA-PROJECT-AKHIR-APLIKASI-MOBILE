import 'package:flutter/material.dart';
import 'package:palugada/child/booking_summary_page.dart';
import 'package:palugada/vehicles.dart';

class Review {
  final String author;
  final String text;
  final String date;

  Review({
    required this.author,
    required this.text,
    required this.date,
  });
}

class ServiceDetailsPage extends StatelessWidget {
  final ServiceProvider serviceProvider;

  ServiceDetailsPage({required this.serviceProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details - ${serviceProvider.name}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(serviceProvider.imagePath, fit: BoxFit.cover),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceProvider.profession,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      serviceProvider.price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'About Service Provider',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(serviceProvider.imagePath),
              ),
              title: Text(serviceProvider.name),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Service Provider of Eternal Bliss Weddings\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          'woman, 25 y.o, graduate of Harvard University, majoring in Event Management.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Reviews specific to Han Soo Hee
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/icons/kendal.png'),
              ),
              title: Text('Kendal Jenner'),
              subtitle: Text(
                'Pengalaman kami dengan Eternal Bliss Weddings benar-benar luar biasa! Han Soo Hee adalah seorang profesional sejati. Dari awal konsultasi hingga hari pernikahan, ia memastikan setiap detail terpenuhi dengan sempurna. Kreativitas dan dedikasinya terlihat dalam setiap aspek acara kami. Terima kasih, Han Soo Hee, karena telah menjadikan hari istimewa kami tak terlupakan!',
              ),
              trailing: Text('04 Apr 2023'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/icons/gigi.png'),
              ),
              title: Text('Gigi Hadid'),
              subtitle: Text(
                'Eternal Bliss Weddings benar-benar mewujudkan impian kami! Han Soo Hee adalah perencana yang luar biasa, sangat profesional, dan perhatian terhadap detail. Dari awal hingga akhir, dia memastikan semuanya berjalan lancar dan sesuai keinginan kami. Pelayanannya yang ramah dan responsif membuat kami merasa sangat dihargai. Terima kasih, Han Soo Hee, atas hari pernikahan yang sempurna dan tak terlupakan!',
              ),
              trailing: Text('03 Apr 2023'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingSummaryPage(
                      serviceName: serviceProvider.profession,
                      serviceImage: serviceProvider.imagePath,
                      price: 70000, // example price
                      discount: 10.0, // example discount
                      quantity: 1,
                      serviceProviderName: '', // example quantity
                    ),
                  ),
                );
              },
              child: Text('Book Service'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromARGB(255, 104, 55, 161), // text color
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CallPage()),
                    );
                  },
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  icon: Icon(Icons.message),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  icon: Icon(Icons.map),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SharePage()),
                    );
                  },
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call'),
      ),
      body: Center(
        child: Text('Call the service provider here'),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Tom Holland'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Chat messages will be displayed here
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Send message functionality can be added here
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: Text('Map view here'),
      ),
    );
  }
}

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Service Provider'),
      ),
      body: Center(
        child: Text('This is the share page.'),
      ),
    );
  }
}
