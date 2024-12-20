import 'package:flutter/material.dart';
import 'package:portfolio/Fucntions/globalfunctions.dart';
import 'package:portfolio/utils/Theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileSection extends StatelessWidget {
  final VoidCallback onViewCV;

  const ProfileSection({required this.onViewCV, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity, // Makes the image take the full width
          height: isAndroidWeb()? MediaQuery.of(context).size.height * 0.8 : MediaQuery.of(context).size.height * 0.7,
            child: Image.asset(
          "assets/back1.png",
          fit: BoxFit.cover,
        )),
        Container(
          width: double.infinity, // Makes the image take the full width
           height: isAndroidWeb()? MediaQuery.of(context).size.height * 0.8 : MediaQuery.of(context).size.height * 0.7,
            child: Image.asset(
          "assets/back2.png",
          fit: BoxFit.cover,
        )),
        Positioned(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 40),
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
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                "Software Engineer".text.color(AppConstant.primaryColor).xl.bold.make(),
                SizedBox(height: 5),
                Container(
                  width: isAndroidWeb()? null : MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Student pursuing bachelors in software engineering (BESE) having experience in application development with clean architecure & cloud based operations I have a strong grasp of the basics of software development and have a passion for learning new technologies. ',
                    
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14,color: Colors.white,),
                  ).pOnly(left: 10, right: 10),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),backgroundColor: WidgetStatePropertyAll(AppConstant.primaryColor)),
                  onPressed: onViewCV,
                  child: 'View My CV'.text.color(AppConstant.textColor).bold.make(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
