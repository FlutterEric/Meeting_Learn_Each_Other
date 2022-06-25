import 'package:flutter/material.dart';
import 'package:room_learn_each_other/My%20Home%20Page/HomePost.dart';
import 'package:room_learn_each_other/My%20Home%20Page/HomeRoom.dart';


class MyHomePage extends StatefulWidget {

  String Email;
  String Name;
  String Photo;
  String MyEmail;
  String MyName;
  String MyPhoto;

  MyHomePage({
    Key? key,
    required this.Email,
    required this.Name,
    required this.Photo,
    required this.MyEmail,
    required this.MyName,
    required this.MyPhoto
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  widget.Name + ' Home Page',
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Post',
                      icon: Icon(
                          Icons.post_add_outlined
                      ),
                    ),
                    Tab(
                      text: 'History Meeting Room',
                      icon: Icon(
                          Icons.meeting_room_sharp
                      ),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  HomePostPage(
                    email: widget.Email,
                    photo: widget.Photo,
                    name: widget.Name,
                    MyEmail: widget.MyEmail,
                    MyName: widget.MyName,
                    MyPhoto: widget.MyPhoto,
                  ),
                  HomeRoomPage(
                    email: widget.Email,
                    photo: widget.Photo,
                    name: widget.Name,
                    MyEmail: widget.MyEmail,
                    MyName: widget.MyName,
                    MyPhoto: widget.MyPhoto,
                  ),
                ],
              )
          ),
        )
    );
  }
}



