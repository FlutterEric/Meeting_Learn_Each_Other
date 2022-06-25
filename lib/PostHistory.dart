import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:room_learn_each_other/checkpic.dart';
import 'package:room_learn_each_other/label.dart';


class PostHistory extends StatefulWidget {

  String MyEmail;
  String MyName;
  String MyPhoto;

  PostHistory({
    Key? key,
    required this.MyEmail,
    required this.MyName,
    required this.MyPhoto
  }) : super(key: key);

  @override
  State<PostHistory> createState() => _PostHistoryState();
}

class _PostHistoryState extends State<PostHistory> {

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

  CollectionReference reff = FirebaseFirestore.instance.collection(widget.MyEmail + ' Add Post');
  final size = MediaQuery.of(context).size.height;

  return MaterialApp(
    home: Scaffold(
      body: StreamBuilder(
        stream: reff.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];

                  return data['Email'] == widget.MyEmail ?
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: InkWell(
                                            onTap: () {},
                                            child: ClipOval(
                                              child: Image.network(
                                                data['Photo'],
                                                alignment: Alignment.topLeft,
                                              ),
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          flex: 8,
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
                                      )
                                    ]
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    data['Time'],
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ReadMoreText(
                                    data['Content'],
                                    trimLines: 2,
                                    colorClickableText: Colors.blue,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    moreStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue
                                    ),
                                    lessStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
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
                                const SizedBox(
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
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          data['Image 1'] != 'False' ?
                                          Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => CheckPic(
                                                              Image1: data['Image 1'],
                                                              Image2: data['Image 2'],
                                                              Image3: data['Image 3'],
                                                              Image4: data['Image 4'],
                                                              Image5: data['Image 5'],
                                                              Image6: data['Image 6'],
                                                              length: data['Image Length']
                                                          )
                                                      )
                                                  );
                                                }, child: Card(
                                              child: Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          data['Image 1'],
                                                        ),
                                                        fit: BoxFit.cover
                                                    ),
                                                  )
                                              ),
                                            )
                                            ),
                                          ):
                                          Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                          data['Image 2'] != 'False' ?

                                          Expanded(
                                            child:InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => CheckPic(
                                                              Image1: data['Image 1'],
                                                              Image2: data['Image 2'],
                                                              Image3: data['Image 3'],
                                                              Image4: data['Image 4'],
                                                              Image5: data['Image 5'],
                                                              Image6: data['Image 6'],
                                                              length: data['Image Length']
                                                          )
                                                      )
                                                  );
                                                },child: Card(
                                              child: Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          data['Image 2'],
                                                        ),
                                                        fit: BoxFit.cover
                                                    ),
                                                  )
                                              ),
                                            )
                                            ),
                                          ) :
                                          Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                          data['Image 3'] != 'False' ?
                                          Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => CheckPic(
                                                              Image1: data['Image 1'],
                                                              Image2: data['Image 2'],
                                                              Image3: data['Image 3'],
                                                              Image4: data['Image 4'],
                                                              Image5: data['Image 5'],
                                                              Image6: data['Image 6'],
                                                              length: data['Image Length']
                                                          )
                                                      )
                                                  );
                                                },
                                                child:  Card(
                                                  child: Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              data['Image 3'],
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                      )
                                                  ),
                                                )
                                            ),
                                          ) :
                                          Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          data['Image 4'] != 'False' ?
                                          Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => CheckPic(
                                                              Image1: data['Image 1'],
                                                              Image2: data['Image 2'],
                                                              Image3: data['Image 3'],
                                                              Image4: data['Image 4'],
                                                              Image5: data['Image 5'],
                                                              Image6: data['Image 6'],
                                                              length: data['Image Length']
                                                          )
                                                      )
                                                  );
                                                },
                                                child: Card(
                                                  child: Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              data['Image 4'],
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                      )
                                                  ),
                                                )
                                            ),
                                          ) :
                                          Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                          data['Image 5'] != 'False' ?
                                          Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => CheckPic(
                                                              Image1: data['Image 1'],
                                                              Image2: data['Image 2'],
                                                              Image3: data['Image 3'],
                                                              Image4: data['Image 4'],
                                                              Image5: data['Image 5'],
                                                              Image6: data['Image 6'],
                                                              length: data['Image Length']
                                                          )
                                                      )
                                                  );
                                                },
                                                child: Card(
                                                  child: Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              data['Image 5'],
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                      )
                                                  ),
                                                )
                                            ),
                                          ) :
                                          Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                          data['Image 6'] != 'False' ?
                                          Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => CheckPic(
                                                              Image1: data['Image 1'],
                                                              Image2: data['Image 2'],
                                                              Image3: data['Image 3'],
                                                              Image4: data['Image 4'],
                                                              Image5: data['Image 5'],
                                                              Image6: data['Image 6'],
                                                              length: data['Image Length']
                                                          )
                                                      )
                                                  );
                                                },
                                                child: Card(
                                                  child: Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              data['Image 6'],
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                      )
                                                  ),
                                                )
                                            ),
                                          ) :
                                          Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
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
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
  );
  }
}



