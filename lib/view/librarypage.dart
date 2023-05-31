import 'package:flutter/material.dart';
import 'package:spotify_clone/lists/list_all.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15,),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Text('Your Library', style: TextStyle(
                  fontFamily: 'SpotifyCircular',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 25,),
              Row(
                children: [
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
                  const SizedBox(width: 7,),
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
                  ),
                  const SizedBox(width: 7,),
                  Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF535353),
                      ),
                      child: const Center(
                        child: Text('Artists', style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          color: Colors.white,),
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140.0,),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 4,
                          mainAxisSpacing: 15
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index){
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
                          child: Row(
                            children: [
                              SizedBox(
                                  height: double.infinity,
                                  width: MediaQuery.of(context).size.width*0.22,
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
                        );
                      }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

