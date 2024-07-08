import 'package:flutter/material.dart';
import 'package:palugada/child/ServiceDetailsPage.dart';

class WeddingPage extends StatelessWidget {
  final List<ServiceProvider> serviceProviders = [
    ServiceProvider(
      name: 'Han Soo Hee',
      imagePath: 'assets/icons/hansohee.png',
      profession: 'Wedding Organizer',
      price: 'Rp70.000.000',
      rating: 4,
      reviews: 212,
    ),
    ServiceProvider(
      name: 'Lily Collin',
      imagePath: 'assets/icons/lily.png',
      profession: 'Wedding Organizer',
      price: 'Rp90.000.000',
      rating: 5,
      reviews: 300,
    ),
    ServiceProvider(
      name: 'Emma Watson',
      imagePath: 'assets/icons/emma.png',
      profession: 'Wedding Organizer',
      price: 'Rp50.000.000',
      rating: 3,
      reviews: 150,
    ),
    ServiceProvider(
      name: 'Angelina Jolie',
      imagePath: 'assets/icons/angelina.png',
      profession: 'Wedding Organizer',
      price: 'Rp85.000.000',
      rating: 5,
      reviews: 220,
    ),
    ServiceProvider(
      name: 'Megan Fox',
      imagePath: 'assets/icons/megan.png',
      profession: 'Wedding Organizer',
      price: 'Rp25.000.000',
      rating: 2,
      reviews: 120,
    ),
    ServiceProvider(
      name: 'Jennie Kim',
      imagePath: 'assets/icons/jennie.png',
      profession: 'Wedding Organizer',
      price: 'Rp75.000.000',
      rating: 4,
      reviews: 180,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Wedding Organizer'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: serviceProviders.length,
        itemBuilder: (context, index) {
          return ServiceProviderCard(serviceProvider: serviceProviders[index]);
        },
      ),
    );
  }
}

class ServiceProvider {
  final String name;
  final String imagePath;
  final String profession;
  final String price;
  final int rating;
  final int reviews;

  ServiceProvider({
    required this.name,
    required this.imagePath,
    required this.profession,
    required this.price,
    required this.rating,
    required this.reviews,
  });
}

class ServiceProviderCard extends StatelessWidget {
  final ServiceProvider serviceProvider;

  ServiceProviderCard({required this.serviceProvider});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.indigo.shade400,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(serviceProvider.imagePath),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        serviceProvider.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                  Text(
                    serviceProvider.profession,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    serviceProvider.price,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < serviceProvider.rating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '(${serviceProvider.reviews} Reviews)',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ServiceDetailsPage(serviceProvider: serviceProvider),
                  ),
                );
              },
              child: Text('Contact Now'),
            ),
          ],
        ),
      ),
    );
  }
}
