import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              IconButton(
                icon: Icon(Icons.email),
                onPressed: () => _launchURL('mailto:abdulwahab31990@gmail.com'),
              ),
              IconButton(
                icon: Icon(Icons.phone),
                onPressed: () => _launchURL('tel:+03112709619'),
              ),
              IconButton(
                icon: Icon(Icons.safety_check),
                onPressed: () => _launchURL('https://wa.me/03112709619'),
              ),
              IconButton(
                icon: Icon(Icons.link),
                onPressed: () => _launchURL(
                    'https://www.linkedin.com/in/abdul-wahab-4659772ba'),
              ),
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () =>
                    _launchURL('https://www.facebook.com/your_profile'),
              ),
              IconButton(
                icon: Icon(CupertinoIcons.scope),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/your_profile'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
