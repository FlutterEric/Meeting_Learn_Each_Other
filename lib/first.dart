import 'package:flutter/material.dart';

import 'Page/RoomCall.dart';
import 'Page/Setting.dart';
import 'Page/home.dart';


class FirstPage extends StatefulWidget {

  String email;
  String photo;
  String name;
  String id;

  FirstPage({
    Key? key,
    required this.email,
    required this.name,
    required this.photo,
    required this.id
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int curret = 0;

  @override
  Widget build(BuildContext context) {

    final page = [
      HomePage(
        name: widget.name,
        email: widget.email,
        photo: widget.photo
      ),
      RoomCallPage(
        name: widget.name,
        email: widget.email,
        photo: widget.photo,
        id: widget.id,
      ),
      SettingPage(
        name: widget.name,
        email: widget.email,
        photo: widget.photo,
      )
    ];

    return Scaffold(
      body: page[curret],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curret,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home
              ),
              label: "Home",
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.video_call_outlined
              ),
              label: "Room",
              backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.settings_applications
              ),
              label: "Setting",
              backgroundColor: Colors.purple
          ),
        ],
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: const IconThemeData(
            color: Colors.blue,
            size: 30
        ),
        unselectedIconTheme: const IconThemeData(
            color: Colors.blue,
            size: 25
        ),
        onTap: (index) {
          setState(() {
            curret = index;
          });
        },
      ),
    );
  }
}



