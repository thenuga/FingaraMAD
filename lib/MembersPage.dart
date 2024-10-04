import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/BookingPage.dart';
import 'package:untitled/GalleryPage.dart';
import 'package:untitled/PaymentsPage.dart';

class Memberspage extends StatefulWidget {
  const Memberspage({super.key});

  @override
  State<Memberspage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<Memberspage> {
  Position? _currentLocation;
  String _currentAddress = "Getting location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentAddress = "Location services are disabled.";
      });
      return;
    }

    // Check and request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentAddress = "Location permissions are denied.";
        });
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentAddress = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get the current position
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = position;
        _currentAddress =
        "Lat: ${position.latitude}, Long: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        _currentAddress = "Failed to get location: $e";
      });
      print("Error: $e");
    }
  }


  int _selectedIndex = 0;

  // List of pages corresponding to the bottom navigation tabs
  final List<Widget> _pages = [
    Bookingpage(),
    PaymentPage(),
    GalleryPage(),
    Memberspage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[_selectedIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('HomePage'),
              onTap: () {
                Navigator.pushNamed(context, 'homepage');
              },
            ),
            ListTile(
              title: Text('Booking'),
              onTap: () {
                Navigator.pushNamed(context, 'booking');
              },
            ),
            ListTile(
              title: Text('Membership'),
              onTap: () {
                Navigator.pushNamed(context, 'members');
              },
            ),
            ListTile(
              title: Text('Payment'),
              onTap: () {
                Navigator.pushNamed(context, 'payment');
              },
            ),
            ListTile(
              title: Text('Events'),
              onTap: () {
                Navigator.pushNamed(context, 'events');
              },
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, 'gallery');
              },
            ),
            ListTile(
              title: Text('News'),
              onTap: () {
                Navigator.pushNamed(context, 'news');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/john.jpeg'),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Phone Number: 123-456-7890',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Location: $_currentAddress', // Display location coordinates
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Address: 123 Main St, City',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Status: Active',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text("Get Location"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor:
        Colors.blue,
        selectedLabelStyle:
        TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(
            color: Colors.blue),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Members',
          ),
        ],
      ),
    );
  }
}
