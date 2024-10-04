import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';


import 'main.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {


  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu '),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Welcome User', style: TextStyle(fontSize: 22, ), ),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome Fingara Club',
                style: TextStyle(
                  color: themeNotifier.isDarkMode ? Colors.black : Colors.black,
                  fontSize: 33,
                  shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(context, 'assets/booking.png', 'Booking', 'booking'),
                      _buildButton(context, 'assets/transaction.png', 'Payment', 'payment'),
                      _buildButton(context, 'assets/gallery.png', 'Gallery', 'gallery'),
                    ],
                  ),
                  const SizedBox(width: 20), // Space between the two columns
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(context, 'assets/members.png', 'Profile', 'members'),
                      _buildButton(context, 'assets/events.png', 'Events', 'events'),
                      _buildButton(context, 'assets/news.png', 'News', 'news'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: IconButton(
                icon: Icon(
                  themeNotifier.isDarkMode ? Icons.brightness_7 : Icons.brightness_2,
                ),
                onPressed: () {
                  themeNotifier.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String imagePath, String text, String route) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0), // Space around each button
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: themeNotifier.isDarkMode
              ? Colors.grey[800]?.withOpacity(0.8)
              : Colors.white.withOpacity(0.8), // Button background color
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 74.0,
              width: 44.0,
            ),
            const SizedBox(width: 18),
            Text(
              text,
              style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
