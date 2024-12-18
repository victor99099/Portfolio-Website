import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

import '../utils/Theme.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                'Projects',
                style: TextStyle(
                  color: AppConstant.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Electronics Ecommerce App
          ProjectCard(
            title: 'Electronics Ecommerce',
            keyFeature: "User convenice and usability was prioritized with one tap user sign-in and fast response times & a smooth interface supported by Firebase's real-time capabilities.",
            videoUrl: 'assets/Ecommerceproject.mp4',
            githubUrl: 'https://github.com/victor99099/e_commerce',
            downloadUrl:
                'https://drive.google.com/file/d/1rUIyLihhRoyziC6leYigKQ5TekhOS0aN/view?usp=sharing',
            launchURL: _launchURL,
          ),

          SizedBox(height: 20),

          // Weather App
          ProjectCard(
            title: 'Weather',
            keyFeature: "✔ Utilizes Singleton and Observer design patterns for efficient state management. \n✔ Ensures reusability, maintainability, and scalability with clean architecture. \n✔ Streamlined development and collaboration with Git for version control. \n✔ Performance Optimization using parallel fetching."
,
            videoUrl: 'assets/WeatherProjectVideo.mp4',
            githubUrl: 'https://github.com/victor99099/WeatherApp',
            downloadUrl:
                'https://drive.google.com/file/d/1qVtHuGTJNDdIjTYKy4b0rk39zKY_sWw6/view?usp=sharing',
            launchURL: _launchURL,
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String keyFeature;
  final String videoUrl;
  final String githubUrl;
  final String downloadUrl;
  final Function(String) launchURL;

  const ProjectCard({
    required this.title,
    required this.keyFeature,
    required this.videoUrl,
    required this.githubUrl,
    required this.downloadUrl,
    required this.launchURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child: Card(
        color: AppConstant.cardColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppConstant.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                child: AspectRatio(
                  aspectRatio: 1, // Set aspect ratio to 1:1
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Optional: Rounded corners
                    child: VideoApp(videoUrl: videoUrl),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Key Features",
                    style: TextStyle(
                      color: AppConstant.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.left,
                  ),
                  5.heightBox,
                  Text(
                    keyFeature,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => launchURL(downloadUrl),
                    child: Card(
                      color: AppConstant.cardColor,
                      child: Row(
                        children: [
                          Image.asset("assets/GitLogo.png",fit: BoxFit.contain,),
                          Text("Download APK")
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(),
                    onPressed: () => launchURL(downloadUrl),
                    icon: Icon(Icons.download),
                    label: Text('Download'),
                  ),
                  SizedBox(width: 10),
                  // ElevatedButton.icon(
                  //   onPressed: () => launchURL(githubUrl),
                  //   icon: Icon(IconIco),
                  //   label: Text('GitHub'),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  final String videoUrl;
  const VideoApp({required this.videoUrl});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
            child: _controller.value.isInitialized
                ? SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: FittedBox(
                      fit: BoxFit.contain, // Ensures no distortion
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  String? _errorMessage;
  bool _isBuffering = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    if (widget.videoUrl == null || widget.videoUrl.isEmpty) {
      setState(() {
        _errorMessage = 'Invalid video URL';
      });
      return;
    }

    try {
      _controller = VideoPlayerController.asset(widget.videoUrl)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              _isBuffering = false;
            });
            _controller.play(); // Automatically start video playback
          }
        }).catchError((error) {
          setState(() {
            _errorMessage = error.toString();
          });
        });

      _controller.addListener(() {
        if (_controller.value.isBuffering && !_isBuffering) {
          setState(() {
            _isBuffering = true;
          });
        } else if (!_controller.value.isBuffering && _isBuffering) {
          setState(() {
            _isBuffering = false;
          });
        }
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Center(
        child: Text(
          'Error: $_errorMessage',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                if (_isBuffering)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
