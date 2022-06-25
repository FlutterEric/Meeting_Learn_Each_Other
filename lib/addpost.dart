import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AddPost extends StatefulWidget {

  String email;
  String photo;
  String name;

  AddPost({
    Key? key,
    required this.email,
    required this.photo,
    required this.name
  }) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  bool add1 = false;
  bool add2 = false;
  bool add3 = false;
  bool add4 = false;
  bool add5 = false;
  bool add6 = false;
  bool add7 = false;
  bool add8 = false;
  bool add9 = false;
  bool add10 = false;

  bool addpic1 = false;
  bool addpic2 = false;
  bool addpic3 = false;
  bool addpic4 = false;
  bool addpic5 = false;

  File? images;
  File? images2;
  File? images3;
  File? images4;
  File? images5;
  File? images6;

  String? coverurl1;
  String? coverurl2;
  String? coverurl3;
  String? coverurl4;
  String? coverurl5;
  String? coverurl6;

  CollectionReference reference = FirebaseFirestore.instance.collection('Add Post');

  TextEditingController label1 = TextEditingController();
  TextEditingController label2 = TextEditingController();
  TextEditingController label3 = TextEditingController();
  TextEditingController label4 = TextEditingController();
  TextEditingController label5 = TextEditingController();
  TextEditingController label6 = TextEditingController();
  TextEditingController label7 = TextEditingController();
  TextEditingController label8 = TextEditingController();
  TextEditingController label9 = TextEditingController();
  TextEditingController label10 = TextEditingController();
  TextEditingController content = TextEditingController();

  ImagePicker picker = ImagePicker();

  /*
  uploadfile1() async {
    final cover = FirebaseStorage.instance.ref('files/').child(
        images!.path);
    UploadTask task1 = cover.putFile(File(images!.path));

    TaskSnapshot snapshot1 = await task1;
    coverurl1 = await snapshot1.ref.getDownloadURL();

    return coverurl1;
  }

  uploadfile2() async {
    final cover2 = FirebaseStorage.instance.ref('files/').child(
        images2!.path);
    UploadTask task2 = cover2.putFile(File(images2!.path));

    TaskSnapshot snapshot2 = await task2;
    coverurl2 = await snapshot2.ref.getDownloadURL();

    return coverurl2;
  }

  uploadfile3() async {
    final cover3 = FirebaseStorage.instance.ref('files/').child(
        images3!.path);
    UploadTask task3 = cover3.putFile(File(images3!.path));

    TaskSnapshot snapshot3 = await task3;
    coverurl3 = await snapshot3.ref.getDownloadURL();

    return coverurl3;
  }

  uploadfile4() async {
    final cover4 = FirebaseStorage.instance.ref('files/').child(
        images4!.path);
    UploadTask task4 = cover4.putFile(File(images4!.path));

    TaskSnapshot snapshot4 = await task4;
    coverurl4 = await snapshot4.ref.getDownloadURL();

    return coverurl4;
  }

  uploadfile5() async {
    final cover5 = FirebaseStorage.instance.ref('files/').child(
        images5!.path);
    UploadTask task5 = cover5.putFile(File(images5!.path));

    TaskSnapshot snapshot5 = await task5;
    coverurl5 = await snapshot5.ref.getDownloadURL();

    return coverurl5;
  }

  uploadfile6() async {
    final cover6 = FirebaseStorage.instance.ref('files/').child(
        images6!.path);
    UploadTask task6 = cover6.putFile(File(images6!.path));

    TaskSnapshot snapshot6 = await task6;
    coverurl6 = await snapshot6.ref.getDownloadURL();

    return coverurl6;
  }
   */

  @override
  Widget build(BuildContext context) {

    CollectionReference ref = FirebaseFirestore.instance.collection(widget.email + ' Add Post');

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'Add Post'
          ),
          actions: [
            IconButton(
              onPressed: () async {

                final progress = ProgressDialog(context);

                progress.style(
                    message: 'Uploading...',
                    borderRadius: 10.0,
                    backgroundColor: Colors.white,
                    progressWidget: const SpinKitPouringHourGlass(
                      color: Colors.blue,
                      size: 30,
                    ),
                    elevation: 10.0,
                    insetAnimCurve: Curves.easeInOut,
                    progress: 0.0,
                    maxProgress: 100.0,
                    progressTextStyle: const TextStyle(
                        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
                    messageTextStyle: const TextStyle(
                        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
                );

                await progress.show();

                if (images != null) {
                  final cover = FirebaseStorage.instance.ref('files/').child(
                      images!.path);
                  UploadTask task1 = cover.putFile(File(images!.path));

                  TaskSnapshot snapshot1 = await task1;
                  coverurl1 = await snapshot1.ref.getDownloadURL();
                }

                if (images2 != null) {
                  final cover2 = FirebaseStorage.instance.ref('files/').child(
                      images2!.path);
                  UploadTask task2 = cover2.putFile(File(images2!.path));

                  TaskSnapshot snapshot2 = await task2;
                  coverurl2 = await snapshot2.ref.getDownloadURL();
                }

                if(images3 != null) {
                  final cover3 = FirebaseStorage.instance.ref('files/').child(
                      images3!.path);
                  UploadTask task3 = cover3.putFile(File(images3!.path));

                  TaskSnapshot snapshot3 = await task3;
                  coverurl3 = await snapshot3.ref.getDownloadURL();
                }


                if (images4 != null) {
                  final cover4 = FirebaseStorage.instance.ref('files/').child(
                      images4!.path);
                  UploadTask task4 = cover4.putFile(File(images4!.path));

                  TaskSnapshot snapshot4 = await task4;
                  coverurl4 = await snapshot4.ref.getDownloadURL();
                }

                if(images5 != null) {
                  final cover5 = FirebaseStorage.instance.ref('files/').child(
                      images5!.path);
                  UploadTask task5 = cover5.putFile(File(images5!.path));

                  TaskSnapshot snapshot5 = await task5;
                  coverurl5 = await snapshot5.ref.getDownloadURL();
                }

                if(images6 != null) {
                  final cover6 = FirebaseStorage.instance.ref('files/').child(
                      images6!.path);
                  UploadTask task6 = cover6.putFile(File(images6!.path));

                  TaskSnapshot snapshot6 = await task6;
                  coverurl6 = await snapshot6.ref.getDownloadURL();
                }

                /*
                images != null ?
                    uploadfile1() :
                    null;

                images2 != null ?
                uploadfile2() :
                null;

                images3 != null ?
                uploadfile3() :
                null;

                images4 != null ?
                uploadfile4() :
                null;

                images5 != null ?
                uploadfile5() :
                null;

                images6 != null ?
                uploadfile6() :
                null;
                 */

                reference.add({
                  'Name' : widget.name,
                  'Email' : widget.email,
                  'Photo' : widget.photo,
                  'Time' : DateTime.now().toString(),
                  'Content' : content.text,
                  'Label 1' : label1.text,
                  'Label 2' : label2.text,
                  'Label 3' : label3.text,
                  'Label 4' : label4.text,
                  'Label 5' : label5.text,
                  'Label 6' : label6.text,
                  'Label 7' : label7.text,
                  'Label 8' : label8.text,
                  'Label 9' : label9.text,
                  'Label 10' : label10.text,
                  'Image 1' : images != null ?
                  coverurl1.toString() :
                  'False',
                  'Image 2' : images2 != null ?
                  coverurl2.toString() :
                  'False',
                  'Image 3' : images3 != null ?
                  coverurl3.toString() :
                  'False',
                  'Image 4' : images4 != null ?
                  coverurl4.toString() :
                  'False',
                  'Image 5' : images5 != null ?
                  coverurl5.toString() :
                  'False',
                  'Image 6' : images6 != null ?
                  coverurl6.toString() :
                  'False',
                  'Image Length' : images != null
                      && images2 != null
                      && images3 != null
                      && images4 != null
                      && images5 != null
                      && images6 != null ?
                  6 :
                  images != null
                      && images2 != null
                      && images3 != null
                      && images4 != null
                      && images5 != null ?
                  5 :
                  images != null
                      && images2 != null
                      && images3 != null
                      && images4 != null ?
                  4 :
                  images != null
                      && images2 != null
                      && images3 != null?
                  3 :
                  images != null
                      && images2 != null?
                  2 :
                  images != null ?
                  1 :
                  0
                });

                ref.add({
                  'Name' : widget.name,
                  'Email' : widget.email,
                  'Photo' : widget.photo,
                  'Time' : DateTime.now().toString(),
                  'Content' : content.text,
                  'Label 1' : label1.text,
                  'Label 2' : label2.text,
                  'Label 3' : label3.text,
                  'Label 4' : label4.text,
                  'Label 5' : label5.text,
                  'Label 6' : label6.text,
                  'Label 7' : label7.text,
                  'Label 8' : label8.text,
                  'Label 9' : label9.text,
                  'Label 10' : label10.text,
                  'Image 1' : images != null ?
                  coverurl1.toString() :
                  'False',
                  'Image 2' : images2 != null ?
                  coverurl2.toString() :
                  'False',
                  'Image 3' : images3 != null ?
                  coverurl3.toString() :
                  'False',
                  'Image 4' : images4 != null ?
                  coverurl4.toString() :
                  'False',
                  'Image 5' : images5 != null ?
                  coverurl5.toString() :
                  'False',
                  'Image 6' : images6 != null ?
                  coverurl6.toString() :
                  'False',
                  'Image Length' : images != null
                      && images2 != null
                      && images3 != null
                      && images4 != null
                      && images5 != null
                      && images6 != null ?
                      6 :
                  images != null
                      && images2 != null
                      && images3 != null
                      && images4 != null
                      && images5 != null ?
                      5 :
                  images != null
                      && images2 != null
                      && images3 != null
                      && images4 != null ?
                      4 :
                  images != null
                      && images2 != null
                      && images3 != null?
                      3 :
                  images != null
                      && images2 != null?
                      2 :
                  images != null ?
                      1 :
                      0
                }).whenComplete(() =>
                    back()
                );
                await progress.hide();
              },
              icon: const Icon(
                Icons.cloud_upload,
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  'Content',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 23
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: content,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    hintText: 'Type Content...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.yellow,
                      )
                    )
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          'Label',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 23
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 5),
                        child: Text(
                          ' (Most 10)',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 23
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (1)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label1,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add2 == true ?
                        Container(
                          width: 0,
                          height: 0,
                        ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add1 = !add1;
                        });
                      },
                      child: add1 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                color: Colors.yellow,
              ),
              add1 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (2)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label2,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add3 == true ?
                    Container(
                      width: 0,
                      height: 0,
                    ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add2 = !add2;
                        });
                      },
                      child: add2 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
                  Container(
                    width: 0,
                    height: 0,
                  ),
              add2 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (3)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label3,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add4 == true ?
                    Container(
                      width: 0,
                      height: 0,
                    ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add3 = !add3;
                        });
                      },
                      child: add3 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add3 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (4)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label4,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add5 == true ?
                        Container(
                          width: 0,
                          height: 0,
                        ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add4 = !add4;
                        });
                      },
                      child: add4 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add4 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (5)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label5,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add6 == true ?
                        Container(
                          width: 0,
                          height: 0,
                        ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add5 = !add5;
                        });
                      },
                      child: add5 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add5 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (6)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label6,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add7 == true ?
                        Container(
                          width: 0,
                          height: 0,
                        ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add6 = !add6;
                        });
                      },
                      child: add6 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add6 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (7)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label7,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add8 == true ?
                        Container(
                          width: 0,
                          height: 0,
                        ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add7 = !add7;
                        });
                      },
                      child: add7 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add7 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (8)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label8,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: add9 == true ?
                        Container(
                          width: 0,
                          height: 0,
                        ) :
                    InkWell(
                      onTap: () {
                        setState(() {
                          add8 = !add8;
                        });
                      },
                      child: add8 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add8 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (9)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label9,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          add9 = !add9;
                        });
                      },
                      child: add9 == false ?
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ) :
                      const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              add9 == true ?
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Label (10)',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: label10,
                      decoration: InputDecoration(
                          labelText: 'Label',
                          hintText: 'Type Label...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          )
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.yellow,
                  ),
                ],
              ) :
              Container(
                width: 0,
                height: 0,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      'Picture',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      ' (Most 6)',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 23
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        XFile? image = await picker.pickImage(source: ImageSource.camera);

                                        final imageget = File(image!.path);

                                        setState(() {
                                          images = imageget;
                                        });
                                      },
                                      title: const Text(
                                        'Camera',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18
                                        ),
                                      ),
                                      leading: const Icon(
                                          Icons.camera_alt
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ListTile(
                                        onTap: () async {
                                          XFile? image = await picker.pickImage(source: ImageSource.gallery);

                                          final imageget = File(image!.path);

                                          setState(() {
                                            images = imageget;
                                          });
                                        },
                                        title: const Text(
                                          'Gallery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),
                                        leading: const Icon(
                                            Icons.image_outlined
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }
                            );
                          },
                          child: Card(
                            child: Container(
                              height: 150,
                              child: images != null ?
                                  Image.file(
                                    File(images!.path),
                                    height: 150,
                                  ) :
                              const Center(
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 60,
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                    images != null ?
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          onTap: () async {
                                            XFile? image = await picker.pickImage(source: ImageSource.camera);

                                            final imageget = File(image!.path);

                                            setState(() {
                                              images2= imageget;
                                            });
                                          },
                                          title: const Text(
                                            'Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                          ),
                                          leading: const Icon(
                                              Icons.camera_alt
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            onTap: () async {
                                              XFile? image = await picker.pickImage(source: ImageSource.gallery);

                                              final imageget = File(image!.path);

                                              setState(() {
                                                images2 = imageget;
                                              });
                                            },
                                            title: const Text(
                                              'Gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            leading: const Icon(
                                                Icons.image_outlined
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Card(
                              child: Container(
                                height: 150,
                                child: images2 != null ?
                                Image.file(
                                  File(images2!.path),
                                  height: 150,
                                ) :
                                const Center(
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ) :
                        Container(
                          width: 0,
                          height: 0,
                        ),
                    images2 != null ?
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          onTap: () async {
                                            XFile? image = await picker.pickImage(source: ImageSource.camera);

                                            final imageget = File(image!.path);

                                            setState(() {
                                              images3= imageget;
                                            });
                                          },
                                          title: const Text(
                                            'Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                          ),
                                          leading: const Icon(
                                              Icons.camera_alt
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            onTap: () async {
                                              XFile? image = await picker.pickImage(source: ImageSource.gallery);

                                              final imageget = File(image!.path);

                                              setState(() {
                                                images3 = imageget;
                                              });
                                            },
                                            title: const Text(
                                              'Gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            leading: const Icon(
                                                Icons.image_outlined
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Card(
                              child: Container(
                                height: 150,
                                child: images3 != null ?
                                Image.file(
                                  File(images3!.path),
                                  height: 150,
                                ) :
                                const Center(
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    images3 != null ?
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          onTap: () async {
                                            XFile? image = await picker.pickImage(source: ImageSource.camera);

                                            final imageget = File(image!.path);

                                            setState(() {
                                              images4 = imageget;
                                            });
                                          },
                                          title: const Text(
                                            'Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                          ),
                                          leading: const Icon(
                                              Icons.camera_alt
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            onTap: () async {
                                              XFile? image = await picker.pickImage(source: ImageSource.gallery);

                                              final imageget = File(image!.path);

                                              setState(() {
                                                images4 = imageget;
                                                });
                                            },
                                            title: const Text(
                                              'Gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            leading: const Icon(
                                                Icons.image_outlined
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Card(
                              child: Container(
                                height: 150,
                                child: images4 != null ?
                                Image.file(
                                  File(images4!.path),
                                  height: 150,
                                ) :
                                const Center(
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ) :
                        Container(
                          width: 0,
                          height: 0,
                        ),
                    images4 != null ?
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          onTap: () async {
                                            XFile? image = await picker.pickImage(source: ImageSource.camera);

                                            final imageget = File(image!.path);

                                            setState(() {
                                              images5 = imageget;
                                            });
                                          },
                                          title: const Text(
                                            'Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                          ),
                                          leading: const Icon(
                                              Icons.camera_alt
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            onTap: () async {
                                              XFile? image = await picker.pickImage(source: ImageSource.gallery);

                                              final imageget = File(image!.path);

                                              setState(() {
                                                images5 = imageget;
                                              });
                                            },
                                            title: const Text(
                                              'Gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            leading: const Icon(
                                                Icons.image_outlined
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Card(
                              child: Container(
                                height: 150,
                                child: images5 != null ?
                                Image.file(
                                  File(images5!.path),
                                  height: 150,
                                ) :
                                const Center(
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    ),
                    images5 != null ?
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          onTap: () async {
                                            XFile? image = await picker.pickImage(source: ImageSource.camera);

                                            final imageget = File(image!.path);

                                            setState(() {
                                              images6 = imageget;
                                            });
                                          },
                                          title: const Text(
                                            'Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                          ),
                                          leading: const Icon(
                                              Icons.camera_alt
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            onTap: () async {
                                              XFile? image = await picker.pickImage(source: ImageSource.gallery);

                                              final imageget = File(image!.path);

                                              setState(() {
                                                images6 = imageget;
                                              });
                                            },
                                            title: const Text(
                                              'Gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            leading: const Icon(
                                                Icons.image_outlined
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Card(
                              child: Container(
                                height: 150,
                                child: images6 != null ?
                                Image.file(
                                  File(images6!.path),
                                  height: 150,
                                ) :
                                const Center(
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ) :
                    Container(
                      width: 0,
                      height: 0,
                    )
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  back() async {
    Fluttertoast.showToast(
        msg: 'Uploaded, please login again',
        toastLength: Toast.LENGTH_LONG
    );
    exit(0);
  }
}



