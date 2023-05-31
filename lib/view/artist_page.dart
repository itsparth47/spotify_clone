import 'package:flutter/material.dart';
import 'package:spotify_clone/view/song_screen.dart';

class ArtistScreen extends StatefulWidget {

  final String title;
  final String coverimage;
  final String aboutimage;
  final List<String> songicon;
  final List<String> songs;
  final List<String> popular;
  final List<String> albumicon;
  final List<String> albums;
  final List<String> albumyear;
  final List<String> featuringimage;
  final List<String> featuringnames;
  final List<String> artistplaylistimage;
  final List<String> artistplaylistnames;
  final List<String> similarimages;
  final List<String> similarnames;
  final int songcount;
  final int albumcount;
  final int playlistcount;
  final String monthlylisteners;
  final String about;
  final List<String> canvas;
  final List<String> music;

  const ArtistScreen({
    required this.title,
    required this.coverimage,
    required this.aboutimage,
    required this.songicon,
    required this.songs,
    required this.popular,
    required this.albumicon,
    required this.albums,
    required this.albumyear,
    required this.featuringimage,
    required this.featuringnames,
    required this.artistplaylistimage,
    required this.artistplaylistnames,
    required this.similarimages,
    required this.similarnames,
    required this.songcount,
    required this.albumcount,
    required this.playlistcount,
    required this.monthlylisteners,
    required this.about,
    required this.canvas,
    required this.music,
    Key? key
  }) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.coverimage),
                      fit: BoxFit.cover)),
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'SpotifyCircular',
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.monthlylisteners} monthly listeners',
                    style: const TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 27,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.grey)),
                        child: const Center(
                          child: Text(
                            'Follow',
                            style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.more_vert_sharp,
                        color: Colors.white,
                      ),
                      const Icon(
                        Icons.shuffle,
                        color: Colors.white,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade500,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 47,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Popular',
                    style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  GridView.builder(
                    shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: widget.songcount,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          childAspectRatio: 6
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SongScreen(
                              title: widget.songs[index],
                              canvas: widget.canvas[index],
                              song: widget.music[index],
                            )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7.0, right: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text((index+1).toString(), style: const TextStyle(
                                        fontFamily: 'SpotifyCircular',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage(widget.songicon[index])),
                                          borderRadius: BorderRadius.circular(7)
                                      ),
                                      height: 60,
                                      width: 60,
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.songs[index], style: const TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        ),
                                        Text(widget.popular[index], style: const TextStyle(
                                            fontFamily: 'SpotifyCircular',
                                            fontSize: 13,
                                            color: Colors.white70
                                        ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(Icons.more_vert, color: Colors.white70, )
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 30,),
                  const Text(
                    'Popular Releases',
                    style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  GridView.builder(
                    shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: widget.albumcount,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          childAspectRatio: 4
                      ),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(widget.albumicon[index])),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.albums[index], style: const TextStyle(
                                        fontFamily: 'SpotifyCircular',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                    ),
                                    Text('${widget.albumyear[index]} • Album', style: const TextStyle(
                                        fontFamily: 'SpotifyCircular',
                                        fontSize: 13,
                                        color: Colors.white70
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: const Text('See discography', style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          fontSize: 13,
                          color: Colors.white70
                      ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Text('Featuring ${widget.title}',
                    style: TextStyle(
                        fontFamily: 'CircularSpotify',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 25,),
                  SizedBox(
                    height: 159,
                    child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              Container(
                                height: 135,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(widget.featuringimage[index]), fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(widget.featuringnames[index], style: const TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontSize: 13
                              ),)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Text('About',
                    style: TextStyle(
                        fontFamily: 'CircularSpotify',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.aboutimage), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('VERIFIED ARTIST', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 10,
                              color: Colors.white
                          ),
                          ),
                          const SizedBox(height: 140,),
                          Row(
                            children: [
                              Text(widget.monthlylisteners
                                , style: const TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text('MONTHLY LISTENERS'
                                , style: TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 17,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.about
                                , style: const TextStyle(
                                    fontFamily: 'SpotifyCircular',
                                    fontSize: 15.5,
                                    color: Colors.white
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Text('Artist Playlists',
                    style: TextStyle(
                        fontFamily: 'CircularSpotify',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 25,),
                  SizedBox(
                    height: 159,
                    child: ListView.builder(
                      itemCount: widget.playlistcount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              Container(
                                height: 135,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(widget.artistplaylistimage[index]), fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(widget.artistplaylistnames[index], style: const TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontSize: 13
                              ),)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Text('Fans also like',
                    style: TextStyle(
                        fontFamily: 'CircularSpotify',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 25,),
                  SizedBox(
                    height: 159,
                    child: ListView.builder(
                      itemCount: 12,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(widget.similarimages[index]),
                                radius: 65,
                              ),
                              const SizedBox(height: 8,),
                              Text(widget.similarnames[index], style: const TextStyle(
                                  fontFamily: 'SpotifyCircular',
                                  color: Colors.white,
                                  fontSize: 13
                              ),)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
