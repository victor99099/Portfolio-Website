import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSection extends StatelessWidget {
  final VoidCallback onViewCV;

  const ProfileSection({required this.onViewCV, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity, // Makes the image take the full width
          height: MediaQuery.of(context).size.height * 0.7,
            child: Image.asset(
          "assets/background.jpg",
          fit: BoxFit.cover,
        )),
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40,horizontal: 40),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Abdul Wahab',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Software Engineer | Flutter & Node.js Developer',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onViewCV,
                  child: Text('View My CV'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
