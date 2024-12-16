import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

            // Projects Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Electronics Ecommerce App
                  ProjectCard(
                    title: 'Electronics Ecommerce App',
                    videoUrl: 'assets/Ecommerceproject.mp4',
                    githubUrl: 'https://github.com/victor99099/e_commerce',
                    downloadUrl:
                        'https://drive.google.com/file/d/1rUIyLihhRoyziC6leYigKQ5TekhOS0aN/view?usp=sharing',
                    launchURL: _launchURL,
                  ),

                  SizedBox(height: 20),

                  // Weather App
                  ProjectCard(
                    title: 'Weather App',
                    videoUrl: 'assets/WeatherProjectVideo.mp4',
                    githubUrl: 'https://github.com/victor99099/WeatherApp',
                    downloadUrl:
                        'https://drive.google.com/file/d/1qVtHuGTJNDdIjTYKy4b0rk39zKY_sWw6/view?usp=sharing',
                    launchURL: _launchURL,
                  ),
                ],
              ),
            ),

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



class ProjectCard extends StatelessWidget {
  final String title;
  final String videoUrl;
  final String githubUrl;
  final String downloadUrl;
  final Function(String) launchURL;

  const ProjectCard({
    required this.title,
    required this.videoUrl,
    required this.githubUrl,
    required this.downloadUrl,
    required this.launchURL,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoApp(videoUrl: videoUrl),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => launchURL(downloadUrl),
                  icon: Icon(Icons.download),
                  label: Text('Download'),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => launchURL(githubUrl),
                  icon: Icon(Icons.code),
                  label: Text('GitHub'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
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
