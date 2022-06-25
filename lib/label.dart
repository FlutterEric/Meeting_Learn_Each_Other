import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:room_learn_each_other/checkpic.dart';
import 'package:room_learn_each_other/label/Post.dart';
import 'package:room_learn_each_other/label/Room.dart';


class LabelPage extends StatefulWidget {

  String label;
  String email;
  String name;
  String photo;

  LabelPage({
    Key? key,
    required this.label,
    required this.email,
    required this.photo,
    required this.name
  }) : super(key: key);

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {

  CollectionReference reference = FirebaseFirestore.instance.collection('Add Post');

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

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
              widget.label + ' Label',
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
                  text: 'Ongoing Meeting',
                  icon: Icon(
                      Icons.meeting_room_sharp
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              PostPage(
                label: widget.label,
                email: widget.email,
                photo: widget.photo,
                name: widget.name,
              ),
              RoomPage(
                label: widget.label,
                email: widget.email,
                name: widget.name,
                photo: widget.photo,
              ),
            ],
          )
        ),
      )
    );
  }
}



