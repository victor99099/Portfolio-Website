import 'package:flutter/material.dart';
import 'package:portfolio/Fucntions/globalfunctions.dart';
import 'package:portfolio/utils/Theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ServicesSkills extends StatelessWidget {
  const ServicesSkills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isAndroidWeb()? const EdgeInsets.only(top :20) : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'My ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Skills',
                style: TextStyle(
                  color: AppConstant.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ..._buildAnimatedSkills(),
          const AnimatedSkillCard(image: "assets/cloudLogo.png", text: "Have proficiency in deploying applications & backend on AWS and Firebase. Furthermore utilizing cloud database (FirebaseDatabase & AWS DynamoDB) and Managing Cloud Storage (FirebaseStorage & AWS Storage) for applications", heading: "Cloud Architecture")

        ],
      ),
    );
  }

  List<Widget> _buildAnimatedSkills() {
    final skills = [
      {
        "heading": "Flutter",
        "image": "assets/flutterLogo.png",
        "text":
            "Have Strong proficiency in developing Cross-Platform App interfaces & API Integration using dart with clean architecture plus scalable and maintainable code",
      },
      {
        "heading": "Node & Express JS",
        "image": "assets/nodeLogo.jpg",
        "text":
            "Have proficiency in developing backend using RestFul APIs with Node & Express JS",
      },
      
      {
        "heading": "Dev Tools",
        "image": "assets/toolLogo.png",
        "text":
            "Have experience in using VSCode, Postman, GitHub, Docker, GitHub, AWS Console, Firebase Console, Figma, Filmora, Canva",
      },
      {
        "heading": "Other Languages",
        "image": "assets/plLogo.jpg",
        "text":
            "Have experience in working with Python, C++, SQL(Postgres), Java, HTML, CSS, JavaScript",
      },
    ];

    return skills.map((skill) {
      return AnimatedSkillCard(
        heading: skill['heading']!,
        image: skill['image']!,
        text: skill['text']!,
      );
    }).toList();
  }
}

class AnimatedSkillCard extends StatefulWidget {
  final String image;
  final String text;
  final String heading;

  const AnimatedSkillCard({
    super.key,
    required this.image,
    required this.text,
    required this.heading,
  });

  @override
  _AnimatedSkillCardState createState() => _AnimatedSkillCardState();
}

class _AnimatedSkillCardState extends State<AnimatedSkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0), // Start from left
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.heading}-${widget.image}"),
      onVisibilityChanged: (visibilityInfo) {
       
        if (visibilityInfo.visibleFraction > 0.3 && !_isVisible) {
          _isVisible = true;
           
          _controller.forward();
        }
        _isVisible = false;
      },
      child: SlideTransition(
        position: _slideAnimation,
        child: SkillCard(
          image: widget.image,
          text: widget.text,
          heading: widget.heading,
        ),
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final String image;
  final String text;
  final String heading;
  const SkillCard(
      {super.key,
      required this.image,
      required this.text,
      required this.heading});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: isAndroidWeb()? const EdgeInsets.all(0) : const EdgeInsets.all(10),
                width: double.infinity,
                child: Card(
                  color: AppConstant.cardColor,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppConstant.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            widget.image, // Replace with your image URL
                            width:MediaQuery.of(context).size.width * 0.15, // Circle size
                            height: 70,
                            fit: BoxFit
                                .contain, // Ensures the image fits within the circle
                          ).p12(),
                        ),
                        10.widthBox,
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.heading.text
                                    .color(AppConstant.primaryColor)
                                    .xl2
                                    .align(TextAlign.left)
                                    .make(),
                                Text(
                                  widget.text,
                                  softWrap: true,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
