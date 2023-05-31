import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
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
      )
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
                        ),                          ],
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
                          ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                          : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
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
                          ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                          : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
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
                          ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                          : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
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
                          ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                          : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
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

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => Page1State();
}

class Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  height: 50,
                  child: const Center(
                    child: Text(
                      'GET PREMIUM',
                      style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('From 119/month after. Offer only for users who are new to', style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    fontSize: 12,
                    color: Color(0xFF535353)
                ),
                ),
                Row(
                  children: const [
                    Text('Premium. ', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 12,
                        color: Color(0xFF535353)
                    ),
                    ),
                    Text('Terms and Conditions apply', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF535353)
                    ),
                    height: 270,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Why join Premium?', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 18,
                              color: Colors.white
                          ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.check, color: Colors.green, size: 27,),
                              SizedBox(width: 10,),
                              Text('Download to listen offline without wifi', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Colors.white
                              ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.check, color: Colors.green, size: 27,),
                              SizedBox(width: 10,),
                              Text('Music without ad interruptions', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Colors.white
                              ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.check, color: Colors.green, size: 27,),
                              SizedBox(width: 10,),
                              Text('2x higher sound quality than out free plan', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Colors.white
                              ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.check, color: Colors.green, size: 27,),
                              SizedBox(width: 10,),
                              Text('Cancel monthly plans online anytime', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Colors.white
                              ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 50,),
                Container(
                  height: 67,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF535353)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Spotify Free', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('CURRENT PLAN', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 57,),
                const Text('Pick your Premium', style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                ),
                const SizedBox(height: 35,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.blueAccent
                          ])
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Mini', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 17,
                                color: Colors.white
                            ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('From ₹7', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 25,
                                    color: Colors.white
                                ),
                                ),
                                Text('FOR 1 DAY', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                          child : Text('1 day and 1 week plans • Ad-free music on mobile'
                              ' • Download 30 songs on one mobile device'
                              ' • Mobile only plan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'VIEW PLANS',
                              style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Prices vary according to duration of plan.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Terms and Conditons', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            ),
                            Text('apply.', style: TextStyle(
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
                ),
                const SizedBox(height: 33,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Colors.green.shade700,
                            Colors.green.shade300
                          ])
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Premium Individual', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 17,
                                color: Colors.white
                            ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('Free', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 25,
                                    color: Colors.white
                                ),
                                ),
                                Text('FOR 1 MONTH', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                          child : Text('Ad-free music listening'
                              ' • Download to listen offline'
                              ' • Debit and credit cards accepted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'VIEW PLANS',
                              style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Offer only for users who are new to Premium.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Terms and Conditons', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            ),
                            Text('apply.', style: TextStyle(
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
                ),
                const SizedBox(height: 33,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Colors.lightBlueAccent.shade100,
                            Colors.lightBlueAccent.shade700
                          ])                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Premium Duo', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 17,
                                color: Colors.white
                            ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('Free', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 25,
                                    color: Colors.white
                                ),
                                ),
                                Text('FOR 1 Month', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                          child : Text('2 Premium accounts • For couples who live together'
                              ' • Ad-free music listening'
                              ' • Download 10,000 songs/device, on upto 5 devices per account'
                              ' • Choose 1, 3, 6 or 12 months of Premium'
                              ' • Debit and credit cards accepted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'VIEW PLANS',
                              style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Offer only for users who are new to Premium.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Terms and Conditons', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            ),
                            Text('apply.', style: TextStyle(
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
                ),
                const SizedBox(height: 33,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.purple
                          ])                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Premium Family', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 17,
                                color: Colors.white
                            ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('Free', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 25,
                                    color: Colors.white
                                ),
                                ),
                                Text('FOR 1 Month', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                          child : Text(
                            ' • Ad-free music listening'
                                ' • Choose 1, 3, 6 or 12 months of Premium'
                                ' • Debit and credit cards accepted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'VIEW PLANS',
                              style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Offer only for users who are new to Premium.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Terms and Conditons', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            ),
                            Text('apply.', style: TextStyle(
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
                ),
                const SizedBox(height: 33,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.orangeAccent.shade100
                          ])                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Premium Student', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 17,
                                color: Colors.white
                            ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('Free', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 25,
                                    color: Colors.white
                                ),
                                ),
                                Text('FOR 1 Month', style: TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                          child : Text(
                            ' • Ad-free music listening'
                                ' • Download to listen offline',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 15,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'VIEW PLANS',
                              style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Offer only for users who are new to Premium.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Terms and Conditons', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            ),
                            Text('apply.', style: TextStyle(
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
                ),
                const SizedBox(height: 145,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
