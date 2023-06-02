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
        return web;
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
    apiKey: 'AIzaSyD5gzAyvCgckLn2JJ2O3pQtykL8br9EA44',
    appId: '1:315786623768:web:24dd850b9272bfd9fffc6d',
    messagingSenderId: '315786623768',
    projectId: 'esp32-kr-swelys',
    authDomain: 'esp32-kr-swelys.firebaseapp.com',
    databaseURL:
        'https://esp32-kr-swelys-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'esp32-kr-swelys.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkvQElkerHB2J0cb4uu-e4zpWD_9l_fRY',
    appId: '1:315786623768:android:ee58bef4f272f7dffffc6d',
    messagingSenderId: '315786623768',
    projectId: 'esp32-kr-swelys',
    databaseURL:
        'https://esp32-kr-swelys-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'esp32-kr-swelys.appspot.com',
  );
}