import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showtime/api/api.dart';
import 'package:showtime/models/movie.dart';
import 'package:showtime/pages/movies_screen.dart';
import 'package:showtime/pages/tvseries_screen.dart';
import 'package:showtime/utils/colors.dart';
import 'package:showtime/widgets/movies_slider.dart';
import 'package:showtime/widgets/trending_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;

  List<Widget> widgetList = [MoviesScreen(), TVSeriesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: const Text('SHOWTIME'),
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,

        
      ),

      body: IndexedStack(
        index: myIndex,
        children: widgetList,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        backgroundColor: Colours.scaffoldBgColor,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Series'),
        ],
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
      ),
    );
  }
}
