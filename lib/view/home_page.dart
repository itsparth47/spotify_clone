import 'package:flutter/material.dart';
import 'package:spotify_clone/lists/anuv.dart';
import 'package:spotify_clone/lists/blackpink.dart';
import 'package:spotify_clone/lists/doja.dart';
import 'package:spotify_clone/lists/kali.dart';
import 'package:spotify_clone/lists/lisa.dart';
import 'package:spotify_clone/lists/list_all.dart';
import 'package:spotify_clone/lists/taylor.dart';
import 'package:spotify_clone/view/artist_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ListView(
            children: [
              const SizedBox(height: 30,),
              const Text('Good morning', style: TextStyle(
                  fontFamily: 'SpotifyCircular',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 25,),
              Row(
                children: [
                  const SizedBox(width: 5,),
                  Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF535353),
                      ),
                      child: const Center(
                        child: Text('Music', style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          color: Colors.white,),
                        ),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF535353),
                      ),
                      child: const Center(
                        child: Text('Podcasts & Shows', style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          color: Colors.white,),
                        ),
                      )
                  )
                ],
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            if(index == 0){
                              return ArtistScreen(
                                  title: 'BLACKPINK',
                                  coverimage: bpcoverimage,
                                  aboutimage: bpaboutimage,
                                  songicon: bpsongicon,
                                  songs: bpsongs,
                                  popular: bppopular,
                                  albumicon: bpalbumicon,
                                  albums: bpalbums,
                                  albumyear: bpalbumyear,
                                  featuringimage: bpfeaturingimage,
                                  featuringnames: bpfeaturingnames,
                                  artistplaylistimage: bpartistplaylistimage,
                                  artistplaylistnames: bpartistplaylistnames,
                                  similarimages: bpsimilarimages,
                                  similarnames: bpsimilarnames,
                                songcount: 5,
                                albumcount: 4,
                                playlistcount: 6,
                                monthlylisteners: bpmonthlylisteners,
                                about: bpabout,
                                canvas: bpcanvas,
                                music: bpmusic,
                              );
                            }
                            else if(index == 1){
                              return ArtistScreen(
                                title: 'Anuv Jain',
                                coverimage: anuvcoverimage,
                                aboutimage: anuvaboutimage,
                                songicon: anuvsongicon,
                                songs: anuvsongs,
                                popular: anuvpopular,
                                albumicon: anuvalbumicon,
                                albums: anuvalbums,
                                albumyear: anuvalbumyear,
                                featuringimage: anuvfeaturingimage,
                                featuringnames: anuvfeaturingnames,
                                artistplaylistimage: anuvartistplaylistimage,
                                artistplaylistnames: anuvartistplaylistnames,
                                similarimages: anuvsimilarimages,
                                similarnames: anuvsimilarnames,
                                songcount: 5,
                                albumcount: 4,
                                playlistcount: 1,
                                monthlylisteners: anuvmonthlylisteners,
                                about: anuvabout,
                                canvas: anuvcanvas,
                                music: anuvmusic,
                              );
                            }
                            else if(index == 2){
                              return ArtistScreen(
                                title: 'Taylor Swift',
                                coverimage: taylorcoverimage,
                                aboutimage: tayloraboutimage,
                                songicon: taylorsongicon,
                                songs: taylorsongs,
                                popular: taylorpopular,
                                albumicon: tayloralbumicon,
                                albums: tayloralbums,
                                albumyear: tayloralbumyear,
                                featuringimage: taylorfeaturingimage,
                                featuringnames: taylorfeaturingnames,
                                artistplaylistimage: taylorartistplaylistimage,
                                artistplaylistnames: taylorartistplaylistnames,
                                similarimages: taylorsimilarimages,
                                similarnames: taylorsimilarnames,
                                songcount: 5,
                                albumcount: 3,
                                playlistcount: 3,
                                monthlylisteners: taylormonthlylisteners,
                                about: taylorabout,
                                canvas: taylorcanvas,
                                music: taylormusic,
                              );
                            }
                            else if(index == 3){
                              return ArtistScreen(
                                  title: 'LISA',
                                  coverimage: lisacoverimage,
                                  aboutimage: lisaaboutimage,
                                  songicon: lisasongicon,
                                  songs: lisasongs,
                                  popular: lisapopular,
                                  albumicon: lisaalbumicon,
                                  albums: lisaalbums,
                                  albumyear: lisaalbumyear,
                                  featuringimage: lisafeaturingimage,
                                  featuringnames: lisafeaturingnames,
                                  artistplaylistimage: lisaartistplaylistimage,
                                  artistplaylistnames: lisaartistplaylistnames,
                                  similarimages: lisasimilarimages,
                                  similarnames: lisasimilarnames,
                                songcount: 4,
                                albumcount: 2,
                                playlistcount: 3,
                                monthlylisteners: lisamonthlylisteners,
                                about: lisaabout,
                                canvas: lisacanvas,
                                music: lisamusic,
                              );
                            }
                            else if(index == 4){
                              return ArtistScreen(
                                title: 'Doja Cat',
                                coverimage: dojacoverimage,
                                aboutimage: dojaaboutimage,
                                songicon: dojasongicon,
                                songs: dojasongs,
                                popular: dojapopular,
                                albumicon: dojaalbumicon,
                                albums: dojaalbums,
                                albumyear: dojaalbumyear,
                                featuringimage: dojafeaturingimage,
                                featuringnames: dojafeaturingnames,
                                artistplaylistimage: dojaartistplaylistimage,
                                artistplaylistnames: dojaartistplaylistnames,
                                similarimages: dojasimilarimages,
                                similarnames: dojasimilarnames,
                                songcount: 5,
                                albumcount: 4,
                                playlistcount: 2,
                                monthlylisteners: dojamonthlylisteners,
                                about: dojaabout,
                                canvas: dojacanvas,
                                music: dojamusic,
                              );
                            }
                            else{
                              return ArtistScreen(
                                title: 'Kali Uchis',
                                coverimage: kalicoverimage,
                                aboutimage: kaliaboutimage,
                                songicon: kalisongicon,
                                songs: kalisongs,
                                popular: kalipopular,
                                albumicon: kalialbumicon,
                                albums: kalialbums,
                                albumyear: kalialbumyear,
                                featuringimage: kalifeaturingimage,
                                featuringnames: kalifeaturingnames,
                                artistplaylistimage: kaliartistplaylistimage,
                                artistplaylistnames: kaliartistplaylistnames,
                                similarimages: kalisimilarimages,
                                similarnames: kalisimilarnames,
                                songcount: 5,
                                albumcount: 4,
                                playlistcount: 4,
                                monthlylisteners: kalimonthlylisteners,
                                about: kaliabout,
                                canvas: kalicanvas,
                                music: kalimusic,
                              );
                            }
                          } ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF535353)
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 58,
                                  width: MediaQuery.of(context).size.width*0.16,
                                  child:  Image(image: AssetImage(imgs[index]), fit: BoxFit.cover,)
                              ),
                              const SizedBox(width: 10,),
                              Text(artists[index], style: const TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.8,
                    )
                ),
              ),
              const SizedBox(height: 40),
              const Text('Your top mixes',
                style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(height: 20),
              SizedBox(
                height: 187,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7,right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/anuv.jpg'),
                                      fit: BoxFit.cover)
                              ),
                              width: MediaQuery.of(context).size.width*0.39,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 21,
                                        width: 7,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 7,),
                                      const Text('Anuv Jain Mix', style: TextStyle(
                                          fontFamily: 'SpotifyCircular',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  Container(
                                    height: 7,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text('Vishal Mishra, Stephen \nSanchez and the Loca...', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Color(0xFF535353)
                          ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,right: 7),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/blackpink.jpg'),
                                      fit: BoxFit.cover)
                              ),
                              width: MediaQuery.of(context).size.width*0.39,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 21,
                                        width: 7,
                                        color: const Color(0xFFFFD1DC),
                                      ),
                                      const SizedBox(width: 7,),
                                      const Text('BLACKPINK Mix', style: TextStyle(
                                          fontFamily: 'SpotifyCircular',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  Container(
                                    height: 7,
                                    color: const Color(0xFFFFD1DC),),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text('LISA, ROSE and JENNIE \n', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Color(0xFF535353)
                          ),            )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,right: 7),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/doja.jpg'),
                                      fit: BoxFit.cover)
                              ),
                              width: MediaQuery.of(context).size.width*0.39,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 21,
                                        width: 7,
                                        color: Colors.cyanAccent,
                                      ),
                                      const SizedBox(width: 7,),
                                      const Text('Doja Cat Mix', style: TextStyle(
                                          fontFamily: 'SpotifyCircular',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  Container(
                                    height: 7,
                                    color: Colors.cyanAccent,)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text('LISA, ROSE and JENNIE \n', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Color(0xFF535353)
                          ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              const Text('Recently Played',
                style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(height: 20,),
              SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/lisa.jpg'),
                            radius: 53,
                          ),
                          SizedBox(height: 8,),
                          Text('LISA', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage:AssetImage('assets/images/blackpink.jpg'),
                            radius: 53,
                          ),
                          SizedBox(height: 8,),
                          Text('BLACKPINK', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage:AssetImage('assets/images/anuv.jpg'),
                            radius: 53,
                          ),
                          SizedBox(height: 8,),
                          Text('Anuv Jain', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              const Text('Episodes for you',
                style: TextStyle(
                    fontFamily: 'SpotifyCirculararSpotify',
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(height: 20,),
              SizedBox(
                height: 185,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(image: AssetImage('assets/images/tgcf.jpg'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue
                              ),
                              width: 150,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Chapter 1', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),),
                              Text('TGCF', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Color(0xFF535353)
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(image: AssetImage('assets/images/kaidan.jpg'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue
                              ),
                              width: 150,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Episode 1', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),),
                              Text('Kaidan', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Color(0xFF535353)
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(image: AssetImage('assets/images/ts.jpg'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue
                              ),
                              width: 150,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Need', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),),
                              Text('ts starbucks review', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Color(0xFF535353)
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              const Text('Popular artists',
                style: TextStyle(
                    fontFamily: 'SpotifyCirculararSpotify',
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(height: 20,),
              SizedBox(
                height: 168,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/arijit.jpg'),
                            radius: 72,
                          ),
                          SizedBox(height: 8,),
                          Text('Arijit Singh', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage:AssetImage('assets/images/pritam.jpg'),
                            radius: 72,
                          ),
                          SizedBox(height: 8,),
                          Text('Pritam', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage:AssetImage('assets/images/anirudh.jpg'),
                            radius: 72,
                          ),
                          SizedBox(height: 8,),
                          Text('Anirudh Ravichander', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              const Text('Your library',
                style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(height: 20,),
              SizedBox(
                height: 185,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/tgcf.jpg'), fit: BoxFit.cover),
                                  color: Colors.blue
                              ),
                              width: 140,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('1', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),),
                              Text('Playlist', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Color(0xFF535353)
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/kaidan.jpg'), fit: BoxFit.cover),
                                  color: Colors.blue
                              ),
                              width: 140,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('2', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),),
                              Text('Playlist', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Color(0xFF535353)
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/ts.jpg'), fit: BoxFit.cover),
                                  color: Colors.blue
                              ),
                              width: 140,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('3', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),),
                              Text('Playlist', style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 13,
                                  color: Color(0xFF535353)
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 135,)
            ],
          ),
        ),
      ),
    );
  }
}
