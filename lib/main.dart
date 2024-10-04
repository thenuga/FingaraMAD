import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'battery_provider.dart'; // Assuming you have this in your project
import 'Profile.dart';
import 'registration.dart';
import 'BookingPage.dart';
import 'EventsPage.dart';
import 'GalleryPage.dart';
import 'MembersPage.dart';
import 'NewsPage.dart';
import 'PaymentsPage.dart';
import 'login.dart';
import 'homepage.dart';
import 'theme_notifier.dart'; // Import your ThemeNotifier class

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures that Flutter is initialized
  await Firebase.initializeApp( // Initializes Firebase with your options
    options: FirebaseOptions(
      apiKey: "AIzaSyDpdbGpe2uaqpFFf6l77K9SN5P2bC6heHw",
      authDomain: "madlogin-36bc5.firebaseapp.com",
      databaseURL: "https://madlogin-36bc5.firebaseio.com",
      projectId: "madlogin-36bc5",
      storageBucket: "madlogin-36bc5.appspot.com",
      messagingSenderId: "33159153798",
      appId: "1:33159153798:web:9b4e259c898d2421b92907",
      measurementId: "G-30CZWEPEG5",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => BatteryProvider()), // Add BatteryProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: 'login',
      routes: {
        'login': (context) => MyLogin(),
        'registration': (context) => MyRegister(),
        'homepage': (context) => MyHomepage(),
        'payment': (context) => PaymentPage(),
        'booking': (context) => Bookingpage(),
        'gallery': (context) => GalleryPage(),
        'members': (context) => Memberspage(),
        'events': (context) => EventsPage(),
        'news': (context) => Newspage(),
      },
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
