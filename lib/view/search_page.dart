import 'package:flutter/material.dart';
import 'package:spotify_clone/lists/list_all.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search', style: TextStyle(
                fontFamily: 'SpotifyCircular',
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  label: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset('assets/icons/search.png')),
                      const Text('What do u want to listen to?', style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Browse all', style: TextStyle(
                fontFamily: 'SpotifyCircular',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 140),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.5
                ),
                itemCount: 67,
                itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: bg[index]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 17),
                      child:  Text(genres[index], style: const TextStyle(
                          fontFamily: 'SpotifyCircular',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
