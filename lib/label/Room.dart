import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:room_learn_each_other/MyPage.dart';
import 'package:room_learn_each_other/label.dart';


class RoomPage extends StatefulWidget {

  String label;
  String email;
  String name;
  String photo;

  RoomPage({
    Key? key,
    required this.label,
    required this.email,
    required this.photo,
    required this.name
  }) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {

  CollectionReference reference = FirebaseFirestore.instance.collection('Add Room');

  late Timer timer;

  bool isAudioMuted = true;
  bool isAudioOnly = false;
  bool isVideoMuted = true;

  TextEditingController pass = TextEditingController();

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: reference.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];

                return data['Label 1'] == widget.label
                    || data['Label 2'] == widget.label
                    || data['Label 3'] == widget.label
                    || data['Label 4'] == widget.label
                    || data['Label 5'] == widget.label
                    || data['Label 6'] == widget.label
                    || data['Label 7'] == widget.label
                    || data['Label 8'] == widget.label
                    || data['Label 9'] == widget.label
                    || data['Label 10'] == widget.label
                    && data['Email'] != widget.email ?
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
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            data['Password'] == '' ?
                                            showGeneralDialog(
                                              barrierLabel: "Label",
                                              barrierDismissible: false,
                                              barrierColor: Colors.black.withOpacity(0.5),
                                              transitionDuration: const Duration(milliseconds: 700),
                                              context: context,
                                              pageBuilder: (context, anim1, anim2) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16)
                                                    ),
                                                    elevation: 0,
                                                    backgroundColor: Colors.white,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        const SizedBox(height: 5.0),
                                                        CheckboxListTile(
                                                          title: const Text("Audio Muted"),
                                                          value: isAudioMuted,
                                                          onChanged: _onAudioMutedChanged,
                                                        ),
                                                        const SizedBox(height: 5.0),
                                                        CheckboxListTile(
                                                          title: const Text("Audio Only"),
                                                          value: isAudioOnly,
                                                          onChanged: _onAudioOnlyChanged,
                                                        ),
                                                        const SizedBox(height: 5.0),
                                                        CheckboxListTile(
                                                          title: const Text("Video Muted"),
                                                          value: isVideoMuted,
                                                          onChanged: _onVideoMutedChanged,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 15),
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              _joinmeet(data['Meeting ID'], data['Title']);
                                                            },
                                                            child: const Text(
                                                              'Join',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                );
                                              },
                                              transitionBuilder: (context, anim1, anim2, child) {
                                                return SlideTransition(
                                                  position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
                                                  child: child,
                                                );
                                              },
                                            ) :
                                            showGeneralDialog(
                                              barrierLabel: "Label",
                                              barrierDismissible: false,
                                              barrierColor: Colors.black.withOpacity(0.5),
                                              transitionDuration: const Duration(milliseconds: 700),
                                              context: context,
                                              pageBuilder: (context, anim1, anim2) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16)
                                                    ),
                                                    elevation: 0,
                                                    backgroundColor: Colors.white,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        const Text(
                                                          'Please Type Room Password',
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              color: Colors.red
                                                          ),
                                                        ),
                                                        TextField(
                                                          controller: pass,
                                                          decoration: InputDecoration(
                                                              labelText: 'Room Password',
                                                              hintText: 'Type Room Password...',
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors.yellow
                                                                  )
                                                              )
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5.0),
                                                        CheckboxListTile(
                                                          title: const Text("Audio Muted"),
                                                          value: isAudioMuted,
                                                          onChanged: _onAudioMutedChanged,
                                                        ),
                                                        const SizedBox(height: 5.0),
                                                        CheckboxListTile(
                                                          title: const Text("Audio Only"),
                                                          value: isAudioOnly,
                                                          onChanged: _onAudioOnlyChanged,
                                                        ),
                                                        const SizedBox(height: 5.0),
                                                        CheckboxListTile(
                                                          title: const Text("Video Muted"),
                                                          value: isVideoMuted,
                                                          onChanged: _onVideoMutedChanged,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 15),
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              pass.text == data['Password'] ?
                                                              _joinmeet(data['Meeting ID'], data['Title']) :
                                                              Fluttertoast.showToast(
                                                                  msg: 'Password ERROR!!!',
                                                                  toastLength: Toast.LENGTH_LONG,
                                                                  textColor: Colors.red
                                                              );
                                                            },
                                                            child: const Text(
                                                              'Join',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                );
                                              },
                                              transitionBuilder: (context, anim1, anim2, child) {
                                                return SlideTransition(
                                                  position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
                                                  child: child,
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                              'Join'
                                          ),
                                        ),
                                      ),
                                    )
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

  _joinmeet(String meetingid, String title) async {
    Fluttertoast.showToast(
        msg: 'Success To Join',
        toastLength: Toast.LENGTH_LONG
    );

    Map<FeatureFlag, Object> featureFlags = {};

    // Define meetings options here
    var options = JitsiMeetingOptions(
      roomNameOrUrl: meetingid,
      subject: title,
      isAudioMuted: true,
      isVideoMuted: true,
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
          onClosed: () => debugPrint("onClosed")
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



