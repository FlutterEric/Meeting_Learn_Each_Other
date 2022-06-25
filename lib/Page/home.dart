import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:room_learn_each_other/MyPage.dart';
import 'package:room_learn_each_other/addpost.dart';
import 'package:room_learn_each_other/checkpic.dart';
import 'package:room_learn_each_other/label.dart';


class HomePage extends StatefulWidget {

  String email;
  String photo;
  String name;

  HomePage({
    Key? key,
    required this.email,
    required this.photo,
    required this.name
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String query;
  CollectionReference reff = FirebaseFirestore.instance.collection('Add Post');

  CollectionReference reference = FirebaseFirestore.instance.collection('Add Comment');

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Search',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearch(),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: StreamBuilder(
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

                      return data['Email'] != widget.email ?
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
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                    builder: (context) => MyHomePage(
                                                      Email: data['Email'],
                                                      Name: data['Name'],
                                                      Photo: data['Photo'],
                                                      MyEmail: widget.email,
                                                      MyName: widget.name,
                                                      MyPhoto: widget.photo,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                                  email: widget.email,
                                                  photo: widget.photo,
                                                  name: widget.name,
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        width: double.infinity,
                                        child: IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  topRight: Radius.circular(25)
                                                )
                                              ),
                                              builder: (context) {
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsets.only(top: 5),
                                                        child: Center(
                                                          child: Text(
                                                            'Comment',
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 20
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 10),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: ClipOval(
                                                                child: Image.network(
                                                                    widget.photo
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 6,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: TextField(
                                                                  controller: comment,
                                                                  decoration: InputDecoration(
                                                                      labelText: 'Comment',
                                                                      hintText: 'Add Comment...',
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          borderSide: const BorderSide(
                                                                              color: Colors.yellow
                                                                          )
                                                                      )
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                  padding: const EdgeInsets.only(left: 10),
                                                                  child: comment.text.isEmpty ?
                                                                  const Icon(
                                                                    Icons.send,
                                                                    color: Colors.grey,
                                                                  ) :
                                                                  IconButton(
                                                                    onPressed: () {
                                                                      reference.add({
                                                                        'Email' : widget.email,
                                                                        'Photo' : widget.photo,
                                                                        'Name' : widget.name,
                                                                        'Comment' : comment.text.toString(),
                                                                        'Comment Time' : DateTime.now().toString(),
                                                                        'Post Title' : data['Content'],
                                                                        'Post Label 1' : data['Label 1'],
                                                                        'Post Label 2' : data['Label 2'],
                                                                        'Post Label 3' : data['Label 3'],
                                                                        'Post Label 4' : data['Label 4'],
                                                                        'Post Label 5' : data['Label 5'],
                                                                        'Post Label 6' : data['Label 6'],
                                                                        'Post Label 7' : data['Label 7'],
                                                                        'Post Label 8' : data['Label 8'],
                                                                        'Post Label 9' : data['Label 9'],
                                                                        'Post Label 10' : data['Label 10'],
                                                                        'Post Email' : data['Email'],
                                                                        'Post Photo' : data['Photo'],
                                                                        'Post Name' : data['Name'],
                                                                        'Post Time' : data['Time']
                                                                      }).whenComplete(() =>
                                                                          comment.clear()
                                                                      );
                                                                    },
                                                                    icon: const Icon(
                                                                      Icons.send,
                                                                      color: Colors.blue,
                                                                    ),
                                                                  )
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15),
                                                        child: StreamBuilder(
                                                          stream: reference.snapshots(),
                                                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshotx) {
                                                            if(snapshotx.hasData) {
                                                              return Container(
                                                                height: size / 3,
                                                                child: ListView.builder(
                                                                  itemCount: snapshotx.data!.docs.length,
                                                                  itemBuilder: (context, indexs) {
                                                                    final datas = snapshotx.data!.docs[indexs];

                                                                    return datas['Post Time'] == data['Time']
                                                                        && datas['Post Email'] == data['Email']
                                                                        && datas['Post Name'] == data['Name']
                                                                        && datas['Post Photo'] == data['Photo']
                                                                        && datas['Post Title'] == data['Content']?
                                                                    Column(
                                                                      children: [
                                                                        ListTile(
                                                                          onTap: () {},
                                                                          leading: InkWell(
                                                                            onTap: () {},
                                                                            child: ClipOval(
                                                                              child: Image.network(
                                                                                  datas['Photo']
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          title: Column(
                                                                            children: [
                                                                              Text(
                                                                                datas['Name'],
                                                                                style: const TextStyle(
                                                                                    color: Colors.black
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 5),
                                                                                child: Text(
                                                                                  datas['Comment'],
                                                                                  style: const TextStyle(
                                                                                      fontSize: 15
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          trailing: Text(
                                                                            datas['Comment Time'],
                                                                            style: const TextStyle(
                                                                                fontSize: 10,
                                                                                color: Colors.grey
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const Divider(
                                                                          color: Colors.blue,
                                                                        )
                                                                      ],
                                                                    ) :
                                                                        Text('');
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
                                                      )
                                                    ],
                                                  )
                                                );
                                              }
                                            );
                                          },
                                          alignment: Alignment.centerLeft,
                                          icon: const Icon(
                                            Icons.comment,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    )
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
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoModalPopupRoute(
                builder: (context) => AddPost(
                    name: widget.name,
                    email: widget.email,
                    photo: widget.photo
                )
              )
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )
        ),
      ),
    );
  }
}

class MySearch extends SearchDelegate {

  CollectionReference reference = FirebaseFirestore.instance.collection('Add Post');
  CollectionReference ref = FirebaseFirestore.instance.collection('Add Comment');

  String email = FirebaseAuth.instance.currentUser!.email.toString();
  String name = FirebaseAuth.instance.currentUser!.displayName.toString();
  String photo = FirebaseAuth.instance.currentUser!.photoURL.toString();

  TextEditingController comment = TextEditingController();

  bool readmore = false;

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search Post Content...';
  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => const TextStyle(
    color: Colors.black
  );
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
  }
  @override
  Widget buildResults (BuildContext context) => StreamBuilder(
    stream: FirebaseFirestore
    .instance
    .collection('Add Post')
    .snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if(snapshot.hasData) {
        return Container(
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];

              return query == data['Content'] ?
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
                                          onTap: () {
                                            Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage(
                                                          Email: data['Email'],
                                                          Name: data['Name'],
                                                          Photo: data['Photo'],
                                                          MyEmail: email,
                                                          MyPhoto: photo,
                                                          MyName: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                              email: email,
                                              photo: photo,
                                              name: name,
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
                                Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      width: double.infinity,
                                      child: IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(25),
                                                      topRight: Radius.circular(25)
                                                  )
                                              ),
                                              builder: (context) {
                                                return SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets.only(top: 5),
                                                          child: Center(
                                                            child: Text(
                                                              'Comment',
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 20
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 2,
                                                                child: ClipOval(
                                                                  child: Image.network(
                                                                      photo
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 6,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 10),
                                                                  child: TextField(
                                                                    controller: comment,
                                                                    decoration: InputDecoration(
                                                                        labelText: 'Comment',
                                                                        hintText: 'Add Comment...',
                                                                        border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            borderSide: const BorderSide(
                                                                                color: Colors.yellow
                                                                            )
                                                                        )
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                    padding: const EdgeInsets.only(left: 10),
                                                                    child: comment.text.isEmpty ?
                                                                    const Icon(
                                                                      Icons.send,
                                                                      color: Colors.grey,
                                                                    ) :
                                                                    IconButton(
                                                                      onPressed: () {
                                                                        ref.add({
                                                                          'Email' : email,
                                                                          'Photo' : photo,
                                                                          'Name' : name,
                                                                          'Comment' : comment.text.toString(),
                                                                          'Comment Time' : DateTime.now().toString(),
                                                                          'Post Title' : data['Content'],
                                                                          'Post Label 1' : data['Label 1'],
                                                                          'Post Label 2' : data['Label 2'],
                                                                          'Post Label 3' : data['Label 3'],
                                                                          'Post Label 4' : data['Label 4'],
                                                                          'Post Label 5' : data['Label 5'],
                                                                          'Post Label 6' : data['Label 6'],
                                                                          'Post Label 7' : data['Label 7'],
                                                                          'Post Label 8' : data['Label 8'],
                                                                          'Post Label 9' : data['Label 9'],
                                                                          'Post Label 10' : data['Label 10'],
                                                                          'Post Email' : data['Email'],
                                                                          'Post Photo' : data['Photo'],
                                                                          'Post Name' : data['Name'],
                                                                          'Post Time' : data['Time']
                                                                        }).whenComplete(() =>
                                                                            comment.clear()
                                                                        );
                                                                      },
                                                                      icon: const Icon(
                                                                        Icons.send,
                                                                        color: Colors.blue,
                                                                      ),
                                                                    )
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 15),
                                                          child: StreamBuilder(
                                                            stream: ref.snapshots(),
                                                            builder: (context, AsyncSnapshot<QuerySnapshot> snapshotx) {
                                                              if(snapshotx.hasData) {
                                                                return Container(
                                                                  height: MediaQuery.of(context).size.height / 3,
                                                                  child: ListView.builder(
                                                                    itemCount: snapshotx.data!.docs.length,
                                                                    itemBuilder: (context, indexs) {
                                                                      final datas = snapshotx.data!.docs[indexs];

                                                                      return datas['Post Time'] == data['Time']
                                                                          && datas['Post Email'] == data['Email']
                                                                          && datas['Post Name'] == data['Name']
                                                                          && datas['Post Photo'] == data['Photo']
                                                                          && datas['Post Title'] == data['Content']?
                                                                      Column(
                                                                        children: [
                                                                          ListTile(
                                                                            onTap: () {},
                                                                            leading: InkWell(
                                                                              onTap: () {},
                                                                              child: ClipOval(
                                                                                child: Image.network(
                                                                                    datas['Photo']
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            title: Column(
                                                                              children: [
                                                                                Text(
                                                                                  datas['Name'],
                                                                                  style: const TextStyle(
                                                                                      color: Colors.black
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 5),
                                                                                  child: Text(
                                                                                    datas['Comment'],
                                                                                    style: const TextStyle(
                                                                                        fontSize: 15
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            trailing: Text(
                                                                              datas['Comment Time'],
                                                                              style: const TextStyle(
                                                                                  fontSize: 10,
                                                                                  color: Colors.grey
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const Divider(
                                                                            color: Colors.blue,
                                                                          )
                                                                        ],
                                                                      ) :
                                                                      Text('');
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
                                                        )
                                                      ],
                                                    )
                                                );
                                              }
                                          );
                                        },
                                        alignment: Alignment.centerLeft,
                                        icon: const Icon(
                                          Icons.comment,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    )
                                )
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
            }
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return StreamBuilder(
      stream: FirebaseFirestore
          .instance
          .collection('Add Post')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else {
          return ListView(
            children: [
              ...snapshot.data!.docs
                  .where(
                      (QueryDocumentSnapshot<Object?> element) =>
                          element['Content'].toString().toLowerCase()
                              .contains(query.toLowerCase())
              ).map((QueryDocumentSnapshot<Object?> data) {
                String title = data.get('Content');

                return data['Content'] != '' && data['Email'] != email ?
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: ClipOval(
                          child: Image.network(
                              data['Photo']
                          ),
                        ),
                        title: Text(
                          data['Content'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black
                          ),
                        ),
                        subtitle: Text(
                          data['Name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black
                          ),
                        ),
                        onTap: () {
                          query = data['Content'];

                          showResults(context);
                        },
                      ),
                      const Divider()
                    ],
                  )
                ) :
                Container(
                  width: 0,
                  height: 0,
                );
              })
            ]
          );
        }
      },
    );
  }
}

/*

data['Image 1'] != 'False' ?
                                    Expanded(
                                        child: Card(
                                          child: Container(
                                            height: 150,
                                            color: Colors.black,
                                            child: Image.network(
                                                data['Image 1']
                                            ),
                                          ),
                                        )
                                    ) :
                                    Container(
                                      width: 0,
                                      height: 0,
                                    ),
                                    data['Image 1'] != 'False' ?
                                    Expanded(
                                        child: Card(
                                          child: Container(
                                            height: 150,
                                            color: Colors.black,
                                            child: Image.network(
                                                data['Image 1']
                                            ),
                                          ),
                                        )
                                    ) :
                                    Container(
                                      width: 0,
                                      height: 0,
                                    ),
                                    data['Image 1'] != 'False' ?
                                    Expanded(
                                        child: Card(
                                          child: Container(
                                            height: 150,
                                            color: Colors.black,
                                            child: Image.network(
                                                data['Image 1']
                                            ),
                                          ),
                                        )
                                    ) :
                                    Container(
                                      width: 0,
                                      height: 0,
                                    ),
      .where('Label 1',
          isGreaterThanOrEqualTo: query)
          .where('Label 2',
          isGreaterThanOrEqualTo: query)
          .where('Label 3',
          isGreaterThanOrEqualTo: query)
          .where('Label 4',
          isGreaterThanOrEqualTo: query)
          .where('Label 5',
          isGreaterThanOrEqualTo: query)
          .where('Label 6',
          isGreaterThanOrEqualTo: query)
          .where('Label 7',
          isGreaterThanOrEqualTo: query)
          .where('Label 8',
          isGreaterThanOrEqualTo: query)
          .where('Label 9',
          isGreaterThanOrEqualTo: query)
          .where('Label 10',
          isGreaterThanOrEqualTo: query)
          .where('Name')

Container(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          data['Label'],
                          style: const TextStyle(
                              color: Colors.black
                          ),
                        ),
                        onTap: () {
                          query = data['Label']
 */



