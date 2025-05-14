import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:to_do_app/home.dart';

Widget customBorderedButton({
  required String text,
  required VoidCallback onPressed,
  double width = 400,
  double height = 40,
  Color borderColor = const Color(0xFF206412),
  Color textColor = Colors.black,
  double fontSize = 16,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      fixedSize: Size(width, height),
      elevation: 0,
      side: BorderSide(color: borderColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize)),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple.shade50,
                    child: Text(
                      'B',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.purple.shade900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Blossom Aworh',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'blossom.aworh@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  customBorderedButton(
                    text: 'Edit Profile',
                    onPressed: () {
                      // Add your edit profile logic here
                      print('Edit Profile pressed');
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ), // Add some spacing between buttons
                  customBorderedButton(
                    text: 'About us',
                    onPressed: () {
                      // Add your settings logic here
                      print('About us pressed');
                    },
                  ),
                  const SizedBox(height: 10),
                  customBorderedButton(
                    text: 'Privacy policy',
                    onPressed: () {
                      // Add your logout logic here
                      print('Privacy policy pressed');
                    },
                  ),
                  const SizedBox(height: 10),
                  customBorderedButton(
                    text: 'Settings',
                    onPressed: () {
                      // Add your about us logic here
                      print('Settings pressed');
                    },
                  ),
                ],
              ),
              const Spacer(),

              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Log out pressed');
                    },
                    onHover: (value) {
                      StepStyle(color: Colors.white);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),

                    child: Text(
                      'Log out',
                      style: TextStyle(color: Color(0xFFF9A825)),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Delete button
                  ElevatedButton(
                    onPressed: () {
                      print('Delete account buttonpressed');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 40),
                      backgroundColor: Color(0xFFff3b30),
                      elevation: 0,
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'Delete account',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
