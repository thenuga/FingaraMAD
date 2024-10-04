import 'package:flutter/material.dart';

// Define a User class to hold user information
class User {
  final String name;
  final String profilePicture;
  final String membershipStatus;
  final String birthday;
  final String phoneNumber;
  final String address;

  User({
    required this.name,
    required this.profilePicture,
    required this.membershipStatus,
    required this.birthday,
    required this.phoneNumber,
    required this.address,
  });
}

class ProfileEditingPage extends StatelessWidget {
  final User user;

  const ProfileEditingPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: ListView(
        children: [
          // Display user profile details for editing
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.profilePicture),
            ),
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Membership Status: ${user.membershipStatus}'),
          ),
          ListTile(
            title: Text('Birthday: ${user.birthday}'),
          ),
          ListTile(
            title: Text('Phone Number: ${user.phoneNumber}'),
          ),
          ListTile(
            title: Text('Address: ${user.address}'),
          ),
          // Add fields for editing user details here
        ],
      ),
    );
  }
}

// Function to navigate to the profile editing page
void navigateToProfileEditingPage(BuildContext context, User user) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProfileEditingPage(user: user),
    ),
  );
}
