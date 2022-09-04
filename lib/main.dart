import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/firebase_options.dart';
import 'package:firebase_crud/home.dart';
import 'package:firebase_crud/phone_auth/sign_in.dart';
import 'package:firebase_crud/services/notification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // read data from firebase
  //complete collection fetch code

  // QuerySnapshot snapshot =
  //     await FirebaseFirestore.instance.collection("users").get();
  // for (var doc in snapshot.docs) {
  //   log(doc.data().toString());
  // }

  //specific fetch data
  // DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //     .collection("users")
  //     .doc("JTYD7U1wucWE0xjtBQwr")
  //     .get();
  // log(snapshot.data().toString());

  //update firebase data

  // await _firestore
  //     .collection("users")
  //     .doc("JTYD7U1wucWE0xjtBQwr")
  //     .update({"username": "Sumit"});
  // log("Now user updated!");

  //delete Firebase data

  // await _firestore.collection("users").doc("JTYD7U1wucWE0xjtBQwr").delete();
  // log("Now user deleted");

  await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Crud',
      home: (FirebaseAuth.instance.currentUser != null)
          ? HomeScreen()
          : SignInWithPhone(),
    );
  }
}
