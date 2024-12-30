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
    apiKey: 'AIzaSyDE8Y9KcciyaJ0J7UQi6TzyhEafTFBLqEE',
    appId: '1:719410752530:web:9adb6b784ca157aa1bfccb',
    messagingSenderId: '719410752530',
    projectId: 'bericot-37ea1',
    authDomain: 'bericot-37ea1.firebaseapp.com',
    storageBucket: 'bericot-37ea1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCu_W75FJLJhYQ1rJmXrtA_sakxTwCmITg',
    appId: '1:719410752530:android:73cd4401500016ff1bfccb',
    messagingSenderId: '719410752530',
    projectId: 'bericot-37ea1',
    storageBucket: 'bericot-37ea1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVvLYedaMs9ZKcLV-ZcpyDu1sE4-I8SQ0',
    appId: '1:719410752530:ios:b454389b4535f9671bfccb',
    messagingSenderId: '719410752530',
    projectId: 'bericot-37ea1',
    storageBucket: 'bericot-37ea1.firebasestorage.app',
    iosBundleId: 'com.example.bericot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVvLYedaMs9ZKcLV-ZcpyDu1sE4-I8SQ0',
    appId: '1:719410752530:ios:b454389b4535f9671bfccb',
    messagingSenderId: '719410752530',
    projectId: 'bericot-37ea1',
    storageBucket: 'bericot-37ea1.firebasestorage.app',
    iosBundleId: 'com.example.bericot',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDE8Y9KcciyaJ0J7UQi6TzyhEafTFBLqEE',
    appId: '1:719410752530:web:f6c99035fc8e2d571bfccb',
    messagingSenderId: '719410752530',
    projectId: 'bericot-37ea1',
    authDomain: 'bericot-37ea1.firebaseapp.com',
    storageBucket: 'bericot-37ea1.firebasestorage.app',
  );
}