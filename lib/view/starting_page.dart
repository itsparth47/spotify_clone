import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/example.dart';
import 'package:spotify_clone/view/home_page.dart';
import 'package:spotify_clone/view/librarypage.dart';
import 'package:spotify_clone/view/premium_page.dart';
import 'package:spotify_clone/view/search_page.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {

  AudioPlayer audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'assets/songs/');
    final url = await player.load('htl.mp3');
    audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const PremiumScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          pages[pageIndex],
          buildMyNavBar(context),
        ],
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 128.5,
      color: Colors.transparent.withOpacity(.75),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xFF535353),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(image: AssetImage('assets/images/htl.jfif')),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      height: 44,
                      width: 42,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, 'current');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Hard to Love', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                          ),
                          Text('BLACKPINK', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Colors.white70
                          ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Image.asset('assets/icons/desk.png', color: Colors.grey, scale: 2.5,),
                        ),
                        const Icon(Icons.favorite_border, color: Colors.white, size: 27,),
                        const SizedBox(width: 10,),
                        InkWell(
                          child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, size: 32, color: Colors.white,),
                          onTap: ()async{
                            if(_isPlaying){
                              await audioPlayer.pause();
                            } else {
                              await audioPlayer.resume();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SliderTheme(
              data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 2.5,
                  thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0
                  )
              ),
              child: Slider(
                activeColor: Colors.white,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async{
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      icon: pageIndex == 0
                          ? Image.asset('assets/icons/home.png', color: Colors.white, scale: 2.5,)
                          : Image.asset('assets/icons/home.png', color: Colors.grey, scale: 2.5,)
                    ),
                     const Text('Home', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      icon: pageIndex == 1
                          ? Image.asset('assets/icons/search.png', color: Colors.white, scale: 2.5,)
                          : Image.asset('assets/icons/search.png', color: Colors.grey, scale: 2.5,)
                    ),
                    const Text('Search', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                      icon: pageIndex == 2
                          ? Image.asset('assets/icons/library.png', color: Colors.white, scale: 2.5,)
                          : Image.asset('assets/icons/library.png', color: Colors.grey, scale: 2.5,)
                    ),
                    const Text('Your Library', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                      },
                      icon: pageIndex == 3
                          ? Image.asset('assets/icons/prem.png', scale: 2.5,)
                          : Image.asset('assets/icons/prem.png', color: Colors.grey, scale: 2.5,)
                    ),
                    const Text('Premium', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
