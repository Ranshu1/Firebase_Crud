import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/phone_auth/sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => SignInWithPhone()));
  }

 @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message.data["myname"].toString()),
        duration: Duration(seconds: 10),
        backgroundColor: Colors.green,
      ));
    });
    
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("App was opened by a notification"),
        duration: Duration(seconds: 10),
        backgroundColor: Colors.green,
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "username"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _contactController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Contact no."),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _create();
              },
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Create data in Firebase
  Future _create() async {
    final usercollection = FirebaseFirestore.instance.collection("users");
    final docRef = usercollection.doc();

    await docRef.set({"username": _usernameController.text, "contact_no": _contactController.text});
  }
}
