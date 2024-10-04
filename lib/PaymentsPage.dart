import 'package:flutter/material.dart';
import 'package:untitled/BookingPage.dart';
import 'package:untitled/GalleryPage.dart';
import 'package:untitled/MembersPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<DataRow> rows = [
    DataRow(cells: [
      DataCell(Text('01/01/2022')), // Send Date
      DataCell(Text('01/02/2022')), // Receive Date
      DataCell(Text('John Doe')), // Sender Name
      DataCell(Text('Card')), // Payment Method
      DataCell(Text('\$100')), // Price
    ]),
    DataRow(cells: [
      DataCell(Text('02/01/2022')), // Send Date
      DataCell(Text('02/02/2022')), // Receive Date
      DataCell(Text('Jane Smith')), // Sender Name
      DataCell(Text('Cash')), // Payment Method
      DataCell(Text('\$50')), // Price
    ]),
    DataRow(cells: [
      DataCell(Text('03/01/2022')), // Send Date
      DataCell(Text('03/02/2022')), // Receive Date
      DataCell(Text('Alice Johnson')), // Sender Name
      DataCell(Text('PayPal')), // Payment Method
      DataCell(Text('\$75')), // Price
    ]),
    DataRow(cells: [
      DataCell(Text('04/01/2022')), // Send Date
      DataCell(Text('04/02/2022')), // Receive Date
      DataCell(Text('Bob Brown')), // Sender Name
      DataCell(Text('Bank Transfer')), // Payment Method
      DataCell(Text('\$200')), // Price
    ]),
  ];

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

  bool showAllRows = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      drawer: Drawer(
        // Adding the Drawer widget
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            DataTable(
              columnSpacing: 20, // Adjust spacing between columns
              columns: [
                DataColumn(
                    label: SizedBox(
                        width: 100, child: Center(child: Text('Send Date')))),
                DataColumn(
                    label: SizedBox(
                        width: 100,
                        child: Center(child: Text('Receive Date')))),
                DataColumn(
                    label: SizedBox(
                        width: 120, child: Center(child: Text('Sender Name')))),
                DataColumn(
                    label: SizedBox(
                        width: 120,
                        child: Center(child: Text('Payment Method')))),
                DataColumn(
                    label: SizedBox(
                        width: 80, child: Center(child: Text('Price')))),
              ],
              rows: showAllRows
                  ? rows
                  : rows.sublist(0,
                      2), // Show all rows if showAllRows is true, else show only the first two rows
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAllRows = !showAllRows; // Toggle showAllRows state
                });
              },
              child: Text(showAllRows
                  ? 'Show Less'
                  : 'Show More'), // Change button text based on showAllRows state
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
