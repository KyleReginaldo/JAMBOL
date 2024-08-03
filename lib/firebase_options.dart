// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCm75oubWvCGlewGDLwX1zHzSlJ38s67Kk',
    appId: '1:86250787409:web:95a7b2f8ca9a4ebe479e70',
    messagingSenderId: '86250787409',
    projectId: 'e-commerce-f666b',
    authDomain: 'e-commerce-f666b.firebaseapp.com',
    storageBucket: 'e-commerce-f666b.appspot.com',
    measurementId: 'G-VGPJZ48GZ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWmdD-fH0okR-_ZPZxiuh0LcDyEUYVM7Q',
    appId: '1:86250787409:android:411be7e7d2740d92479e70',
    messagingSenderId: '86250787409',
    projectId: 'e-commerce-f666b',
    storageBucket: 'e-commerce-f666b.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCm75oubWvCGlewGDLwX1zHzSlJ38s67Kk',
    appId: '1:86250787409:web:4358c3399b37eabe479e70',
    messagingSenderId: '86250787409',
    projectId: 'e-commerce-f666b',
    authDomain: 'e-commerce-f666b.firebaseapp.com',
    storageBucket: 'e-commerce-f666b.appspot.com',
    measurementId: 'G-FVZHQ357YY',
  );
}
