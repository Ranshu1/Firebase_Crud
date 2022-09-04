// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAzKdUIxaZQZvjpePYVuv0xkLHeJ31DVrM',
    appId: '1:841419612331:web:b4f7f2a46c14510d9d17ee',
    messagingSenderId: '841419612331',
    projectId: 'fir-crud-ee1eb',
    authDomain: 'fir-crud-ee1eb.firebaseapp.com',
    storageBucket: 'fir-crud-ee1eb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJFmpTeU229NOZvznIHedUV8WkUOa0eTI',
    appId: '1:841419612331:android:62717130c1e933179d17ee',
    messagingSenderId: '841419612331',
    projectId: 'fir-crud-ee1eb',
    storageBucket: 'fir-crud-ee1eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQXZ_omnW7HwCTAhfAnwGQTDPIsMmyD2E',
    appId: '1:841419612331:ios:df4f3d72a8dfbf5c9d17ee',
    messagingSenderId: '841419612331',
    projectId: 'fir-crud-ee1eb',
    storageBucket: 'fir-crud-ee1eb.appspot.com',
    iosClientId: '841419612331-hog2i4okcu5vbhnavfsh7b34mgcmbppj.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQXZ_omnW7HwCTAhfAnwGQTDPIsMmyD2E',
    appId: '1:841419612331:ios:df4f3d72a8dfbf5c9d17ee',
    messagingSenderId: '841419612331',
    projectId: 'fir-crud-ee1eb',
    storageBucket: 'fir-crud-ee1eb.appspot.com',
    iosClientId: '841419612331-hog2i4okcu5vbhnavfsh7b34mgcmbppj.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrud',
  );
}