import 'package:flutter/material.dart';
import 'package:palugada/vehicles.dart'; // Import the VehiclesPage
import 'package:palugada/electric.dart';
import 'package:palugada/courier.dart';
import 'package:palugada/salon.dart';
import 'package:palugada/laundry.dart';
import 'package:palugada/wedding.dart';
import 'package:palugada/pages/pesanan.dart';
import 'package:palugada/pages/chat.dart';
import 'package:palugada/pages/profil.dart'; // Import the ProfilePage

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    PesananPage(),
    ChatPage(),
    ProfilePage(), // Add ProfilePage to the widget options
  ];

  bool _isLocationAppBarVisible(int index) {
    // Tampilkan AppBar dengan lokasi hanya pada halaman Home (indeks 0)
    return index == 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isLocationAppBarVisible(_selectedIndex) ? _buildAppBar() : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 234, 182, 255),
        unselectedItemColor: Color.fromARGB(214, 160, 129, 177),
        backgroundColor: Color.fromARGB(255, 255, 254, 255),
        onTap: _onItemTapped,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          // Handle location search or setting location
        },
        child: Row(
          children: [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 5.0),
            Expanded(
              child: Text(
                '19-5-32/12/a/1/b M.G Road, mohmood.....',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            height: kToolbarHeight,
            color: const Color.fromARGB(255, 240, 240, 241),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for services and packages',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AdBanner(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildServiceCard(
                        iconPath: 'assets/icons/car.png',
                        title: 'Vehicles',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehiclesPage(),
                            ),
                          );
                        },
                      ),
                      buildServiceCard(
                        iconPath: 'assets/icons/electric.png',
                        title: 'Electric',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ElectricPage(),
                            ),
                          );
                        },
                      ),
                      buildServiceCard(
                        iconPath: 'assets/icons/delivery.png',
                        title: 'Courier',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourierPage(),
                            ),
                          ); // Handle tap on Courier
                        },
                      ),
                      buildServiceCard(
                        iconPath: 'assets/icons/salon.png',
                        title: 'Salon',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SalonPage(),
                            ),
                          );
                          // Handle tap on Salon
                        },
                      ),
                      buildServiceCard(
                        iconPath: 'assets/icons/laundry.png',
                        title: 'Laundry',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LaundryPage(),
                            ),
                          ); // Handle tap on Laundry
                        },
                      ),
                      buildServiceCard(
                        iconPath: 'assets/icons/wedding.png',
                        title: 'Wedding',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeddingPage(),
                            ),
                          ); // Handle  // Handle tap on Wedding
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServiceCard({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 32,
                height: 32,
              ),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class AdBanner extends StatefulWidget {
  @override
  _AdBannerState createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              Image.asset('assets/icons/ad_banner1.png', fit: BoxFit.cover),
              Image.asset('assets/icons/ad_banner2.png', fit: BoxFit.cover),
              Image.asset('assets/icons/ad_banner3.png', fit: BoxFit.cover),
              Image.asset('assets/icons/ad_banner4.png', fit: BoxFit.cover),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.black : Colors.grey,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
