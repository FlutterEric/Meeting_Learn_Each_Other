import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:room_learn_each_other/MeetingRoomHistory.dart';
import 'package:room_learn_each_other/PostHistory.dart';


class SettingPage extends StatefulWidget {

  String photo;
  String name;
  String email;

  SettingPage({
    Key? key,
    required this.name,
    required this.email,
    required this.photo,
  }) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient:LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green,
                        Colors.blue,
                        Colors.indigo,
                        Color(0x009900ff)
                      ],
                      begin:Alignment.bottomLeft,
                      end: Alignment.topRight
                  )
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipOval(
                            child: Image.network(
                              widget.photo,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.blue
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                PageRouteBuilder(
                                    transitionDuration: const Duration(
                                        seconds: 2
                                    ),
                                    transitionsBuilder: (context, animated, secAnimation, child){
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animated,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, animated, secAnimation){
                                      return PostHistory(
                                        MyEmail: widget.email,
                                        MyName: widget.name,
                                        MyPhoto: widget.photo,
                                      );
                                    }
                                )
                            );
                          },
                          child: ListTile(
                            title: const Text(
                              'Post History',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20
                              ),
                            ),
                            leading: ClipOval(
                              child: Lottie.asset(
                                  'assets/94539-order-history.json',
                                  width: 50,
                                  height: 50,
                                  repeat: true
                              ),
                            ),
                            trailing: ClipOval(
                              child: Lottie.asset(
                                  'assets/25984-carousel-arrow-right.json',
                                  width: 50,
                                  height: 50,
                                  repeat: true
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.yellow,
                        ),
                      ],
                    )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  PageRouteBuilder(
                                      transitionDuration: const Duration(
                                          seconds: 2
                                      ),
                                      transitionsBuilder: (context, animated, secAnimation, child){
                                        return ScaleTransition(
                                          alignment: Alignment.center,
                                          scale: animated,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animated, secAnimation){
                                        return MeetingRoomHistory(
                                          MyEmail: widget.email,
                                          MyName: widget.name,
                                          MyPhoto: widget.photo,
                                        );
                                      }
                                  )
                              );
                            },
                            child: ListTile(
                              title: const Text(
                                'Meeting Room History',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20
                                ),
                              ),
                              leading: ClipOval(
                                child: Lottie.asset(
                                    'assets/94539-order-history.json',
                                    width: 50,
                                    height: 50,
                                    repeat: true
                                ),
                              ),
                              trailing: ClipOval(
                                child: Lottie.asset(
                                    'assets/25984-carousel-arrow-right.json',
                                    width: 50,
                                    height: 50,
                                    repeat: true
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.yellow,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () async {
                                  final show = showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context){
                                        return AlertDialog(
                                          title: const Text(
                                            'Login In',
                                            style: TextStyle(
                                                color: Colors.red
                                            ),
                                          ),
                                          content: const Text(
                                            'Whether to Logout ?',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(context);
                                              },
                                              child: const Text(
                                                  'No'
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                GoogleSignIn().signOut().whenComplete(() =>
                                                    exit(0)
                                                );
                                                Fluttertoast.showToast(
                                                    msg: 'Sign Out',
                                                    backgroundColor: Colors.black.withOpacity(0.5),
                                                    textColor: Colors.white
                                                );
                                              },
                                              child: const Text(
                                                  'Yes'
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                  );
                                },
                                child: ListTile(
                                  title: const Text(
                                    'Sign Out',
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 20
                                    ),
                                  ),
                                  leading: ClipOval(
                                    child: Lottie.asset(
                                        'assets/68582-log-out.json',
                                        width: 50,
                                        height: 50,
                                        repeat: true
                                    ),
                                  ),
                                  trailing: ClipOval(
                                    child: Lottie.asset(
                                        'assets/25984-carousel-arrow-right.json',
                                        width: 50,
                                        height: 50,
                                        repeat: true
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      )
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}



