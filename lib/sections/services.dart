import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/Theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'dart:html' as html;

import 'package:visibility_detector/visibility_detector.dart';

import '../Fucntions/globalfunctions.dart'; // For userAgent detection

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isAndroidWeb()? EdgeInsets.only(top : 20) : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Services',
                style: TextStyle(
                  color: AppConstant.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          isAndroidWeb()
              ? Column(
                  children: [
                    ServiceCard(
                        image: "assets/frontendLogo.png",
                        text:
                            "Modular Frontend Development for Android, IOS, Linux, Windows, MacOS, Web App or all together",
                        heading: "Front-End Development"),
                    10.heightBox,
                    ServiceCard(
                        image: "assets/backendLogo.png",
                        text: "Scalable Backend Development using Restful APIs",
                        heading: "Back-End Development"),
                    10.heightBox,
                    ServiceCard(
                        image: "assets/crossLogo.png",
                        text:
                            "App development with Frontend & Backend integrated for Android, IOS, Linux, Windows, MacOS, Web App or all together",
                        heading: "App Development"),
                    10.heightBox,
                    ServiceCard(
                        image: "assets/cloud2Logo.png",
                        text:
                            "Cloud based Backend hosting, databses, storage, and authentication for applications",
                        heading: "Cloud Architecture"),
                    10.heightBox,
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServiceCard(
                            image: "assets/frontendLogo.png",
                            text:
                                "Modular Frontend Development for Android, IOS, Linux, Windows, MacOS, Web App or all together",
                            heading: "Front-End Development"),
                        // 10.widthBox,
                        ServiceCard(
                            image: "assets/backendLogo.png",
                            text:
                                "Scalable Backend Development using Restful APIs",
                            heading: "Back-End Development"),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        ServiceCard(
                            image: "assets/crossLogo.png",
                            text:
                                "App development with Frontend & Backend integrated for Android, IOS, Linux, Windows, MacOS, Web App or all together",
                            heading: "App Development"),
                        ServiceCard(
                            image: "assets/cloud2Logo.png",
                            text:
                                "Cloud based Backend hosting, databses, storage, and authentication for applications",
                            heading: "Cloud Architecture"),
                      ],
                    )
                  ],
                )
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String image;
  final String text;
  final String heading;

  const ServiceCard({
    super.key,
    required this.image,
    required this.text,
    required this.heading,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false; // Tracks visibility state
  bool _isHovered = false; // Tracks hover state
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
    return VisibilityDetector(
      key: Key(widget.heading),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isVisible
            ? Matrix4.identity()
            : Matrix4.translationValues(0, 50, 0),
        
        child: Opacity(
          opacity: _isVisible ? 1.0 : 0.0,
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
                _controller.forward();
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
                _controller.reverse();
              });
            },
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _isHovered
                      ? _scaleAnimation.value
                      : 1.0, // Default scale is 1.0
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: isAndroidWeb()
              ?  MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 0.485,
                    height: isAndroidWeb()
              ? null : MediaQuery.of(context).size.height * 0.5,
                    child: Card(
                      color: AppConstant.cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppConstant.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                widget.image,
                                width: 250,
                                height: 150,
                                fit: BoxFit.contain,
                              ).p12(),
                            ),
                            10.heightBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.heading.text
                                    .color(AppConstant.primaryColor)
                                    .xl2
                                    .align(TextAlign.left)
                                    .make(),
                                5.heightBox,
                                Text(
                                  widget.text,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
