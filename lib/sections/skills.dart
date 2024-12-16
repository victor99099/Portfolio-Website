

import 'package:flutter/cupertino.dart';

class ServicesSkills extends StatelessWidget {
  const ServicesSkills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services & Skills',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text('- Flutter Development (MVC Architecture)'),
          Text('- Backend Development (Node.js & Express.js)'),
          Text('- Database Management (Firebase, AWS DynamoDB)'),
          Text('- Cloud Hosting (AWS, Firebase Hosting)'),
          Text('- Version Control (GitHub)'),
          Text('- Front-End and Back-End Integration'),
        ],
      ),
    );
  }
}