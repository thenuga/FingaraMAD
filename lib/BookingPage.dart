import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/GalleryPage.dart';
import 'package:untitled/MembersPage.dart';
import 'package:untitled/PaymentsPage.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
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
              child: Text(
                'Welcome User',
                style: TextStyle(
                  fontSize: 22,
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

      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Booking',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryButton(
                              context,
                              'assets/cricket.png',
                              'Cricket',
                              CategoryPage1(
                                bookedTimeSlots: [],
                              )),
                          SizedBox(width: 10), // Add space between buttons
                          _buildCategoryButton(context, 'assets/volleyball.png',
                              'Volleyball', CategoryPage2()),
                          SizedBox(width: 10),
                          _buildCategoryButton(context, 'assets/badminto.png',
                              'Badminton', CategoryPage3()),
                          SizedBox(width: 10),
                          _buildCategoryButton(context, 'assets/basketball.png',
                              'Basketball', CategoryPage4()),
                          SizedBox(width: 10),
                          _buildCategoryButton(context, 'assets/squash.png',
                              'Squash', CategoryPage5()),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Add space between the last button and the new text
                    _buildSportSection('Cricket', [
                      'assets/cricket1.jpeg',
                      'assets/cricket2.jpeg',
                      'assets/cricket3.jpeg',
                      'assets/cricket4.jpeg',
                    ]),
                    Text(
                      'Cricket is a popular bat-and-ball game played between two teams of eleven players each. It is '
                      'played on a large grass field with a rectangular 22-yard pitch at the center. The objective of the game is to score '
                      'runs by hitting the ball and running between the wickets, while the opposing team tries to dismiss the batsmen and'
                      ' limit the runs scored. Cricket is known for its strategic gameplay, rich history, and passionate fanbase, particularly in'
                      ' countries like India, England, Australia, and Pakistan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    _buildSportSection('Basketball', [
                      'assets/basketball1.jpeg',
                      'assets/basketball2.jpeg',
                      'assets/basketball3.jpeg',
                      'assets/basketball4.jpeg',
                    ]),
                    Text(
                      'basketball is a popular bat-and-ball game played between two teams of eleven players each. It is '
                      'played on a large grass field with a rectangular 22-yard pitch at the center. The objective of the game is to score '
                      'runs by hitting the ball and running between the wickets, while the opposing team tries to dismiss the batsmen and'
                      ' limit the runs scored. Cricket is known for its strategic gameplay, rich history, and passionate fanbase, particularly in'
                      ' countries like India, England, Australia, and Pakistan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    _buildSportSection('Badminton', [
                      'assets/badminton1.jpeg',
                      'assets/badminton2.jpeg',
                      'assets/badminton3.jpeg',
                      'assets/badminton4.jpeg',
                    ]),
                    Text(
                      'badminton is a popular bat-and-ball game played between two teams of eleven players each. It is '
                      'played on a large grass field with a rectangular 22-yard pitch at the center. The objective of the game is to score '
                      'runs by hitting the ball and running between the wickets, while the opposing team tries to dismiss the batsmen and'
                      ' limit the runs scored. Cricket is known for its strategic gameplay, rich history, and passionate fanbase, particularly in'
                      ' countries like India, England, Australia, and Pakistan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    _buildSportSection('Squash', [
                      'assets/squash1.jpg',
                      'assets/squash2.jpeg',
                      'assets/squash3.jpeg',
                      'assets/squash4.jpeg',
                      'assets/squash5.jpeg',
                      'assets/squash6.jpg',
                    ]),
                    Text(
                      'Squash is a racket sport played in an enclosed room, known '
                          'as a court, by either two or four people. It is a recreational game '
                          'that’s played all over the world, though it is widely believed to have '
                          'originated in private prep schools in England in the 1800s. It is similar to tennis and an older sport known simply as “rackets,” but has its own unique sets of rules and equipment. The game is typically played with a hollow rubber ball and players take turns hitting it off of any of the “playable” walls in the room. There are usually a number of painted or otherwise understood boundaries, and also a “tin” beneath the main front wall that balls can fall into. A ball that falls into the tin is usually out of play, much like a ball that hits the net in tennis. There are some variations between countries and organizations, ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    // Switch between pages based on selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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

  Widget _buildSportSection(String sport, List<String> photos) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          sport,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  photos[index],
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String imagePath, String label, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => targetPage));
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // Black border line
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpeg'), // Replace 'background_image.jpg' with your image path
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10), // Round borders
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(imagePath,
                  fit: BoxFit.cover, width: 120, height: 120),
            ),
            Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryPage1 extends StatefulWidget {
  final List<String> bookedTimeSlots;

  const CategoryPage1({super.key, required this.bookedTimeSlots});

  @override
  _CategoryPage1State createState() => _CategoryPage1State();
}

class _CategoryPage1State extends State<CategoryPage1> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _phone;
  DateTime _selectedDate = DateTime.now();
  String? _selectedTimeSlot;
  final List<String> _timeSlots = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 1:00 PM',
    '1:00 PM - 2:00 PM',
    '2:00 PM - 3:00 PM',
    '3:00 PM - 4:00 PM',
    '4:00 PM - 5:00 PM',
    '5:00 PM - 6:00 PM',
    '6:00 PM - 7:00 PM',
    '7:00 PM - 8:00 PM',
    '8:00 PM - 9:00 PM',
    '9:00 PM - 10:00 PM',
    '10:00 PM - 11:00 PM',
  ];

  void _submitBooking(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Mark the selected time slot as booked
      if (_selectedTimeSlot != null &&
          !widget.bookedTimeSlots.contains(_selectedTimeSlot)) {
        widget.bookedTimeSlots.add(_selectedTimeSlot!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking submitted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Time slot already booked!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cricket Booking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value;
                  },
                ),
                const SizedBox(height: 20),
                TableCalendar(
                  firstDay: DateTime.utc(2022, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _selectedDate,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(labelText: 'Select Time Slot'),
                  value: _selectedTimeSlot,
                  items: _timeSlots.map((String timeSlot) {
                    return DropdownMenuItem<String>(
                      value: timeSlot,
                      child: Text(timeSlot),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTimeSlot = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a time slot';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _submitBooking(context),
                  child: const Text('Submit Booking'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volleyball Booking'),
      ),
      body: Center(
        child: Text('Welcome to Volleyball Booking'),
      ),
    );
  }
}

class CategoryPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badminton Booking'),
      ),
      body: Center(
        child: Text('Welcome to Badminton Booking'),
      ),
    );
  }
}

class CategoryPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball Booking'),
      ),
      body: Center(
        child: Text('Welcome to Basketball Booking'),
      ),
    );
  }
}

class CategoryPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Squash Booking'),
      ),
      body: Center(
        child: Text('Welcome to Squash Booking'),
      ),
    );
  }
}
