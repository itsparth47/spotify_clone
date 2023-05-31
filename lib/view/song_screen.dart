import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SongScreen extends StatefulWidget {

  final String title;
  final String song;
  final String canvas;

  const SongScreen({
    Key? key,
    required this.title,
    required this.canvas,
    required this.song
}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  late VideoPlayerController _controller;
  final audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if(duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

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

    _controller = VideoPlayerController.asset(widget.canvas)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'assets/songs/');
    final url = await player.load(widget.song);
    audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFF212121),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            Stack(
              alignment:Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: VideoPlayer(_controller),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.transparent.withOpacity(.4),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.arrow_drop_down_sharp, color: Colors.white,),
                          Column(
                            children: const [
                              Text('PLAYING FROM ALBUM', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 12,
                                  color: Colors.white
                              ),
                              ),
                              Text('BORN PINK', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              ),
                            ],
                          ),
                          const Icon(Icons.more_vert_sharp, color: Colors.white,)
                        ],
                      ),
                      const SizedBox(height: 451,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title, style: const TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              ),
                              const Text('BLACKPINK', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 15,
                                  color: Colors.white70
                              ),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite_border, color: Colors.white, size: 27,),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Slider(
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
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(position), style: const TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 12,
                              color: Colors.white70
                          ),
                          ),
                          Text(formatTime(duration-position), style: const TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 12,
                              color: Colors.white70
                          ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.shuffle, size: 30, color: Colors.white,),
                          const Icon(Icons.skip_previous, size: 30, color: Colors.white,),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: InkWell(
                              child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, size: 60,),
                              onTap: ()async{
                                if(_isPlaying){
                                  await audioPlayer.pause();
                                } else {
                                  await audioPlayer.resume();
                                }
                              },
                            ),
                          ),
                          const Icon(Icons.skip_next, size: 30, color: Colors.white,),
                          const Icon(Icons.loop, size: 30, color: Colors.white,)
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Image.asset('assets/icons/desk.png', color: Colors.white, scale: 2.7,),
                          ),
                          const Icon(Icons.share, color: Colors.white,)
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF535353),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Lyrics', style: TextStyle(
                                      fontFamily: 'SpotifyCircular',
                                      fontSize: 17,
                                      color: Colors.white
                                  ),
                                  ),
                                  Icon(Icons.share, color: Colors.white,)
                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Text('Ain''t no magic tool to fix it '
                                , style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 22,
                                    color: Colors.white
                                ),
                              ),
                              const Text('You should keep your distance\n'
                                  'I''m only telling you because I care\n'
                                  'Cause I''m hard to love,\n'
                                  'find it hard to trust\n'
                                  'When it feels too good', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 22,
                                  color: Colors.black
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(image: AssetImage('assets/images/abtp.jpg'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('About the artist', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 17,
                                  color: Colors.white
                              ),
                              ),
                              const SizedBox(height: 100,),
                              const Text('BLACKPINK, which took over '
                                  'the hearts of'
                                , style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                              Row(
                                children: const [
                                  Text(' listeners around the world w'
                                    , style: TextStyle(
                                        fontFamily: 'SpotifyCircular',
                                        fontSize: 13,
                                        color: Colors.grey
                                    ),
                                  ),
                                  Text('...see more'
                                    , style: TextStyle(
                                        fontFamily: 'SpotifyCircular',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('BLACKPINK'
                                        , style: TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 17,
                                            color: Colors.white
                                        ),
                                      ),
                                      Text('25,107,445 monthly listeners'
                                        , style: TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 13,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.grey
                                        )
                                    ),
                                    child: const Center(
                                      child: Text('Follow'
                                        , style: TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(image: AssetImage('assets/images/2.jpg'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Live Events', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 17,
                                  color: Colors.white
                              ),
                              ),
                              const SizedBox(height: 130,),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('Jun 3 - Aug 26'
                                        , style: TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 17,
                                            color: Colors.white
                                        ),
                                      ),
                                      Text('14 events on tour'
                                        , style: TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 13,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.grey
                                        )
                                    ),
                                    child: const Center(
                                      child: Text('Find tickets'
                                        , style: TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
