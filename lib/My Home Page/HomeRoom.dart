import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyPage.dart';
import '../label.dart';


class HomeRoomPage extends StatefulWidget {

  String email;
  String name;
  String photo;
  String MyEmail;
  String MyName;
  String MyPhoto;

  HomeRoomPage({
    Key? key,
    required this.email,
    required this.photo,
    required this.name,
    required this.MyEmail,
    required this.MyName,
    required this.MyPhoto
  }) : super(key: key);

  @override
  State<HomeRoomPage> createState() => _HomeRoomPageState();
}

class _HomeRoomPageState extends State<HomeRoomPage> {

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

    CollectionReference reff = FirebaseFirestore.instance.collection(widget.email + ' Add Room');

    return StreamBuilder(
      stream: reff.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];

                return data['Email'] == widget.email ?
                Column(
                  children: [
                    const Divider(
                      color: Colors.yellow,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage(
                                                        Email: data['Email'],
                                                        Name: data['Name'],
                                                        Photo: data['Photo'],
                                                        MyEmail: widget.email,
                                                        MyPhoto: widget.photo,
                                                        MyName: widget.name,
                                                      )
                                              )
                                          );
                                        },
                                        child: ClipOval(
                                          child: Image.network(
                                            data['Photo'],
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                      )
                                    ),
                                    Expanded(
                                        flex: 6,
                                        child: Padding(
                                            padding: const EdgeInsets.only(left: 30),
                                            child: AnimatedTextKit(
                                              animatedTexts: [
                                                ColorizeAnimatedText(
                                                    data['Name'],
                                                    textStyle: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Horizon',
                                                        color: Colors.blue
                                                    ),
                                                    colors: colorizeColors
                                                ),
                                              ],
                                              isRepeatingAnimation: true,
                                            )
                                        )
                                    ),
                                  ]
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  data['Title'],
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                    data['Label 1'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 1'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 1'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 2'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 2'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 2'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 3'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 3'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 3'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 4'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 4'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 4'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 5'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 5'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 5'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 6'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 6'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 6'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 7'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 7'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 7'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 8'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 8'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 8'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 9'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 9'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 9'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    data['Label 10'] != '' ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => LabelPage(
                                  label: data['Label 10'],
                                  email: widget.MyEmail,
                                  photo: widget.MyPhoto,
                                  name: widget.MyName,
                                )
                            )
                        );
                      },
                      child: Text(
                        '#' + data['Label 10'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                  ],
                ) :
                Container(
                  width: 0,
                  height: 0,
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }
}



