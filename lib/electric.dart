import 'package:flutter/material.dart';
import 'package:palugada/child/serviceDetailsElectric.dart';

class ElectricPage extends StatelessWidget {
  final List<ServiceProvider> serviceProviders = [
    ServiceProvider(
      name: 'Zayn Malik',
      imagePath: 'assets/icons/zayn.png',
      profession: 'Electric repairman',
      price: 'Rp75.000',
      rating: 4,
      reviews: 212,
    ),
    ServiceProvider(
      name: 'John Doe',
      imagePath: 'assets/icons/tom.png',
      profession: 'Electric repairman',
      price: 'Rp80.000',
      rating: 5,
      reviews: 300,
    ),
    ServiceProvider(
      name: 'Jane Smith',
      imagePath: 'assets/icons/leo.png',
      profession: 'Electric repairman',
      price: 'Rp70.000',
      rating: 3,
      reviews: 150,
    ),
    ServiceProvider(
      name: 'Alice Johnson',
      imagePath: 'assets/icons/tomothe.png',
      profession: 'Electric repairman',
      price: 'Rp85.000',
      rating: 5,
      reviews: 220,
    ),
    ServiceProvider(
      name: 'Bob Brown',
      imagePath: 'assets/icons/songkang.png',
      profession: 'Electric repairman',
      price: 'Rp65.000',
      rating: 2,
      reviews: 120,
    ),
    ServiceProvider(
      name: 'Charlie Black',
      imagePath: 'assets/icons/andrew.png',
      profession: 'Electric repairman',
      price: 'Rp90.000',
      rating: 4,
      reviews: 180,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Electric Repairman'),
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
                          color:
                              Colors.white, // Text color to contrast background
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                  Text(
                    serviceProvider.profession,
                    style: TextStyle(
                        color:
                            Colors.white), // Text color to contrast background
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
