import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/BookingPage.dart';
import 'package:untitled/MembersPage.dart';
import 'package:untitled/PaymentsPage.dart';

void main() => runApp(const GalleryPage());

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  File? _image;

  Future<void> getImage(bool isCamera) async {
    // Request camera permission
    var status = await Permission.camera.request();
    if (status.isGranted) {
      // If permission is granted, proceed to pick the image
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 100, // You can adjust the quality here
      );
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } else {
      // If permission is denied, show a message or handle it
      print('Camera permission denied');
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
        title: const Text('Gallery Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _image = null; // Clear the selected image
              });
            },
          ),
        ],
      ),
      drawer: Drawer(  // Drawer Widget
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('HomePage'),
              onTap: () {
                Navigator.pushNamed(context, 'homepage');
              },
            ),
            ListTile(
              title: const Text('Booking'),
              onTap: () {
                Navigator.pushNamed(context, 'booking');
              },
            ),
            ListTile(
              title: const Text('Membership'),
              onTap: () {
                Navigator.pushNamed(context, 'members');
              },
            ),
            ListTile(
              title: const Text('Payment'),
              onTap: () {
                Navigator.pushNamed(context, 'payment');
              },
            ),
            ListTile(
              title: const Text('Events'),
              onTap: () {
                Navigator.pushNamed(context, 'events');
              },
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, 'gallery');
              },
            ),
            ListTile(
              title: const Text('News'),
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
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.photo_library),
              onPressed: () {
                getImage(false); // Pick from gallery
              },
              tooltip: 'Pick from Gallery',
            ),
            const SizedBox(height: 10.0),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                getImage(true); // Pick from camera
              },
              tooltip: 'Take a Photo',
            ),
            const SizedBox(height: 20.0),
            _image == null
                ? Container()
                : Image.file(_image!, height: 300.0, width: 300.0),
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


