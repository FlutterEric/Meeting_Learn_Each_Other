import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';


class AddRoom extends StatefulWidget{

  String id;
  String photo;
  String name;
  String email;

  AddRoom({
    Key? key,
    required this.name,
    required this.email,
    required this.photo,
    required this.id
  }) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {

  CollectionReference reference = FirebaseFirestore.instance.collection('Add Room');

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

  bool isAudioMuted = true;
  bool isAudioOnly = false;
  bool isVideoMuted = true;

  bool passwords = false;

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
  TextEditingController password = TextEditingController();
  TextEditingController title = TextEditingController();

  late Timer timer;

  @override
  Widget build(BuildContext context) {
    TextEditingController meetingid = TextEditingController(
        text: widget.id
    );
    CollectionReference ref = FirebaseFirestore.instance.collection(
        widget.email + ' Add Room');

    _joinMeeting() async {

      Map<FeatureFlag, Object> featureFlags = {};

      // Define meetings options here
      var options = JitsiMeetingOptions(
        roomNameOrUrl: meetingid.text,
        subject: title.text,
        isAudioMuted: isAudioMuted,
        isAudioOnly: isAudioOnly,
        isVideoMuted: isVideoMuted,
        userDisplayName: widget.name,
        userEmail: widget.email,
        userAvatarUrl: widget.photo,
        featureFlags: featureFlags,
      );

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeetWrapper.joinMeeting(
        options: options,
        listener: JitsiMeetingListener(
          onOpened: () => debugPrint("onOpened"),
          onConferenceWillJoin: (url) {
            debugPrint("onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("onConferenceJoined: url: $url");
          },
          onConferenceTerminated: (url, error) {
            debugPrint("onConferenceTerminated: url: $url, error: $error");
          },
          onAudioMutedChanged: (isMuted) {
            debugPrint("onAudioMutedChanged: isMuted: $isMuted");
          },
          onVideoMutedChanged: (isMuted) {
            debugPrint("onVideoMutedChanged: isMuted: $isMuted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint(
              "onScreenShareToggled: participantId: $participantId, "
                  "isSharing: $isSharing",
            );
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint(
              "onParticipantJoined: email: $email, name: $name, role: $role, "
                  "participantId: $participantId",
            );
          },
          onParticipantLeft: (participantId) {
            debugPrint("onParticipantLeft: participantId: $participantId");
          },
          onParticipantsInfoRetrieved: (participantsInfo, requestId) {
            debugPrint(
              "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
                  "requestId: $requestId",
            );
          },
          onChatMessageReceived: (senderId, message, isPrivate) {
            debugPrint(
              "onChatMessageReceived: senderId: $senderId, message: $message, "
                  "isPrivate: $isPrivate",
            );
          },
          onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
          onClosed: () {
            debugPrint("onClosed");
            reference.where("Email", isEqualTo: widget.email).get().then((value) {
              value.docs.forEach((element) {
                reference.doc(element.id).delete().then((value) =>
                    exit(0)
                );
              });
            });
          },
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'Add Your Room',
            style: TextStyle(
              color: Colors.deepPurple,
            ),
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
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400),
                    messageTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600)
                );

                await progress.show();

                reference.add({
                  'Name': widget.name,
                  'Email': widget.email,
                  'Photo': widget.photo,
                  'Meeting ID': meetingid.text,
                  'Label 1': label1.text,
                  'Label 2': label2.text,
                  'Label 3': label3.text,
                  'Label 4': label4.text,
                  'Label 5': label5.text,
                  'Label 6': label6.text,
                  'Label 7': label7.text,
                  'Label 8': label8.text,
                  'Label 9': label9.text,
                  'Label 10': label10.text,
                  'Password': password.text,
                  'Title': title.text
                });

                ref.add({
                  'Name': widget.name,
                  'Email': widget.email,
                  'Photo': widget.photo,
                  'Meeting ID': meetingid.text,
                  'Label 1': label1.text,
                  'Label 2': label2.text,
                  'Label 3': label3.text,
                  'Label 4': label4.text,
                  'Label 5': label5.text,
                  'Label 6': label6.text,
                  'Label 7': label7.text,
                  'Label 8': label8.text,
                  'Label 9': label9.text,
                  'Label 10': label10.text,
                  'Password': passwords == true ?
                  password.text :
                  '123',
                  'Title': title.text
                }).whenComplete(() => _joinMeeting()
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
                  'Add Room Title',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 23
                  ),
                ),
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                    labelText: 'Room Title',
                    hintText: 'Add Room Title...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.yellow
                        )
                    )
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: Column(
                    children: [
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
                          ),
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
                    ],
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  'Room Meeting ID',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 23
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: meetingid,
                  enabled: false,
                  decoration: InputDecoration(
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
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  'Add Password ?',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 23
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.yellow
                              )
                          ),
                          hintText: 'Add Meeting Password',
                          labelText: 'Meeting Password',
                          enabled: passwords == false ?
                          false :
                          true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Switch(
                          value: passwords,
                          onChanged: (bool state) {
                            setState(() {
                              passwords = state;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              CheckboxListTile(
                title: const Text("Audio Muted"),
                value: isAudioMuted,
                onChanged: _onAudioMutedChanged,
              ),
              const SizedBox(height: 16.0),
              CheckboxListTile(
                title: const Text("Audio Only"),
                value: isAudioOnly,
                onChanged: _onAudioOnlyChanged,
              ),
              const SizedBox(height: 16.0),
              CheckboxListTile(
                title: const Text("Video Muted"),
                value: isVideoMuted,
                onChanged: _onVideoMutedChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value!;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }
}



