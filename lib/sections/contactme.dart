import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Fucntions/globalfunctions.dart';
import '../utils/Theme.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isHovered = false.obs;

    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Contact ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Me',
                style: TextStyle(
                  color: AppConstant.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            spacing: isAndroidWeb() ? 40 : 150,
            runSpacing: isAndroidWeb() ? 40 : 150,
            children: [
              ContactBox(
                url: 'https://www.linkedin.com/in/abdul-wahab-4659772ba',
                isHovered: isHovered,
                image: Ionicons.logo_linkedin,
              ),
              ContactBox(
                url: 'https://wa.me/03112709619',
                isHovered: isHovered,
                image: Ionicons.logo_whatsapp,
              ),
              ContactBox(
                url: 'tel:03112709619',
                isHovered: isHovered,
                image: Ionicons.phone_portrait,
              ),
              ContactBox(
                url: 'mailto:abdulwahab31990@gmail.com',
                isHovered: isHovered,
                image: Ionicons.mail,
              ),
              ContactBox(
                url: 'https://github.com/victor99099',
                isHovered: isHovered,
                image: Ionicons.logo_github,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox(
      {super.key,
      required this.isHovered,
      required this.image,
      required this.url});
  final IconData image;
  final String url;
  final RxBool isHovered;
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: (hovering) {
          isHovered.value = hovering;
        },
        onTap: () => _launchURL(url),
        child: SizedBox(
          width: isAndroidWeb()
              ? MediaQuery.of(context).size.width * 0.22
              : MediaQuery.of(context).size.width * 0.08,
          height: isAndroidWeb()
              ? MediaQuery.of(context).size.height * 0.13
              : MediaQuery.of(context).size.height * 0.15,
          child: Obx(
            () => Card(
              shadowColor: isHovered.value ? AppConstant.primaryColor : null,
              elevation: 20,
              color: AppConstant.primaryColor,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    image,
                    size: MediaQuery.of(context).size.height * 0.09,
                    color: Colors.black,
                  )),
            ),
          ),
        ));
  }
}
