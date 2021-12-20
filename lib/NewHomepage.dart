import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_player/maindashboard.dart';
import 'package:music_player/pages/favourites.dart';
import 'package:music_player/pages/mymusic.dart';
import 'package:music_player/pages/player.dart';
import 'package:music_player/pages/settings.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  int _pageIndex = 0;
  final List<Widget> _tablist = [
    MainDashBoard(),
    MusicApp(),
    MyMusic(),
    FavouritesPage(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tablist.elementAt(_pageIndex),
          Positioned(
            bottom: 1,
            left: 1,
            right: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, bottom: 20),
              child: Align(
                alignment: Alignment(0.0, 0.1),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: BottomNavigationBar(
                    selectedItemColor: Colors.purple,
                    unselectedItemColor: Colors.black,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    backgroundColor: Colors.blueGrey.shade300,
                    currentIndex: _pageIndex,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.music_house,
                          //color: Colors.purpleAccent
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.music_note_2,
                          //color: Colors.purpleAccent
                        ),
                        label: 'Now Playing',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Iconsax.music,
                          //color: Colors.purpleAccent
                        ),
                        label: 'My Music',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.heart,
                          //color: Colors.purpleAccent
                        ),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          //color: Colors.purpleAccent,
                        ),
                        label: 'Settings',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
