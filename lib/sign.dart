import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:room_learn_each_other/first.dart';


class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference account = FirebaseFirestore.instance.collection("Account"); //get Account

  GoogleSignInAccount? googleSignInAccount;

  setGoogleAccount() async {
    await GoogleSignIn().signIn().then((value) =>
    googleSignInAccount = value
    );

    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final auth = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );

    CollectionReference someaccount = FirebaseFirestore.instance.collection(googleSignInAccount!.email + "Account");

    account.add({
      "Email" : googleSignInAccount!.email,
      "Name" : googleSignInAccount!.displayName,
      "Photo" : googleSignInAccount!.photoUrl,
      "ID" : googleSignInAccount!.id.toString(),
    });

    someaccount.add({
      "Some Email" : googleSignInAccount!.email,
      "Some Name" : googleSignInAccount!.displayName,
      "Some Photo" : googleSignInAccount!.photoUrl,
      "ID" : googleSignInAccount!.id.toString(),
    });

    return await FirebaseAuth.instance.signInWithCredential(auth).whenComplete(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FirstPage(
                name: googleSignInAccount!.displayName.toString(),
                email: googleSignInAccount!.email,
                photo: googleSignInAccount!.photoUrl.toString(),
                id: googleSignInAccount!.id.toString(),
              )
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null ?
    MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Room Learning',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 170),
                      child: Lottie.network(
                          'https://assets7.lottiefiles.com/private_files/lf30_vAtD7F.json',
                          width: 300,
                          height: 300
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: InkWell(
                        onTap: () => setGoogleAccount(),
                        child: Container(
                            width: 350,
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.blueAccent
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/300/300221.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Sign In With Google',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    ) :
    FirstPage(
      email: FirebaseAuth.instance.currentUser!.email.toString(),
      name: FirebaseAuth.instance.currentUser!.displayName.toString(),
      photo: FirebaseAuth.instance.currentUser!.photoURL.toString(),
      id: FirebaseAuth.instance.currentUser!.uid.toString(),
    );
  }
}



