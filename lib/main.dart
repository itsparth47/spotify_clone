import 'package:flutter/material.dart';
import 'package:spotify_clone/view/current_song.dart';
import 'package:spotify_clone/view/starting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const StartingScreen(),
        'current' : (context) => const CurrentSongScreen(),
       },
    );
  }
}
