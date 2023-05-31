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
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
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

