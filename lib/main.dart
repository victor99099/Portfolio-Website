import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/services.dart';
import 'package:url_launcher/url_launcher.dart';




import 'sections/profile.dart';
import 'sections/skills.dart';
import 'utils/Theme.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    'https://drive.google.com/file/d/1YluNfIM2W7KdOyosXrmlLO0Mzkcy_vHs/view?usp=sharing');
              },
            ),
            
            

            // Services & Skills Section
            ServicesSkills(),

            Services(),

            // Projects Section
            Projects(),


            // Footer Section
            
          ],
        ),
      ),
    );
  }
}



