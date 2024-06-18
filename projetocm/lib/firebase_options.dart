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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyBWH6zWVHsUlJCaF992tpza5jiOaQ9nJd0',
    appId: '1:803711704029:web:ef73931fba6a564b273434',
    messagingSenderId: '803711704029',
    projectId: 'chopper-mobile',
    authDomain: 'chopper-mobile.firebaseapp.com',
    storageBucket: 'chopper-mobile.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJn8vt-FnhbzdbjjAHKJVIl0U6PJKFhRg',
    appId: '1:803711704029:android:130428639b5b2f96273434',
    messagingSenderId: '803711704029',
    projectId: 'chopper-mobile',
    storageBucket: 'chopper-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2UVGI3KwYbbhohC9uQjTx7sUIh9vivUQ',
    appId: '1:803711704029:ios:e42d3e92db128272273434',
    messagingSenderId: '803711704029',
    projectId: 'chopper-mobile',
    storageBucket: 'chopper-mobile.appspot.com',
    iosBundleId: 'com.example.projetocm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2UVGI3KwYbbhohC9uQjTx7sUIh9vivUQ',
    appId: '1:803711704029:ios:e42d3e92db128272273434',
    messagingSenderId: '803711704029',
    projectId: 'chopper-mobile',
    storageBucket: 'chopper-mobile.appspot.com',
    iosBundleId: 'com.example.projetocm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWH6zWVHsUlJCaF992tpza5jiOaQ9nJd0',
    appId: '1:803711704029:web:f9685169a9032f4b273434',
    messagingSenderId: '803711704029',
    projectId: 'chopper-mobile',
    authDomain: 'chopper-mobile.firebaseapp.com',
    storageBucket: 'chopper-mobile.appspot.com',
  );

}