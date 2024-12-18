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
      showSemanticsDebugger: false,
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
            
          ],
        ),
      ),
    );
  }
}



