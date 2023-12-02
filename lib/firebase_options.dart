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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCh5kdrxC3WYHFC1_x6ZIn5G1n9HJJcbhk',
    appId: '1:198212591560:web:3c7086c469b0bb3ace2afd',
    messagingSenderId: '198212591560',
    projectId: 'login-and-signup-e2735',
    authDomain: 'login-and-signup-e2735.firebaseapp.com',
    databaseURL: 'https://login-and-signup-e2735-default-rtdb.firebaseio.com',
    storageBucket: 'login-and-signup-e2735.appspot.com',
    measurementId: 'G-1J1SYSYWDE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSVBm3p6UDXa9Q2d-kJSdWHiYwrnvCzSg',
    appId: '1:198212591560:android:1995f5a33a6e16fcce2afd',
    messagingSenderId: '198212591560',
    projectId: 'login-and-signup-e2735',
    databaseURL: 'https://login-and-signup-e2735-default-rtdb.firebaseio.com',
    storageBucket: 'login-and-signup-e2735.appspot.com',
  );
}
