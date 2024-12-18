import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';



import 'sections/profile.dart';
import 'sections/skills.dart';
import 'utils/Theme.dart';

void main() => runApp(MyPortfolio());

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Profile Section
            ProfileSection(
              onViewCV: () {
                _launchURL(
                    'https://drive.google.com/file/d/1rUIyLihhRoyziC6leYigKQ5TekhOS0aN/view?usp=sharing');
              },
            ),
            
            

            // Services & Skills Section
            ServicesSkills(),

            Services(),

            // Projects Section
            Projects(),


            // Footer Section
            Container(
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
                        onPressed: () =>
                            _launchURL('mailto:abdulwahab31990@gmail.com'),
                      ),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () => _launchURL('tel:+03112709619'),
                      ),
                      IconButton(
                        icon: Icon(Icons.safety_check),
                        onPressed: () =>
                            _launchURL('https://wa.me/03112709619'),
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
                        onPressed: () => _launchURL(
                            'https://www.instagram.com/your_profile'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



