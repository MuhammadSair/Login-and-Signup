import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();

    // print(fCMToken?.then((String val){
    //   print(val);
    // } ));
    // FCMToken.t

    if (kDebugMode) {
      print("Token: $fCMToken");
    }
  }
}
