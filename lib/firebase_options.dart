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
    apiKey: 'AIzaSyDtX_nkagHaC14oJMxGmeHCrY0FDzo_UE4',
    appId: '1:1043915385658:web:c998c6d96a023e0fbc3e03',
    messagingSenderId: '1043915385658',
    projectId: 'lo-mark',
    authDomain: 'lo-mark.firebaseapp.com',
    storageBucket: 'lo-mark.appspot.com',
    measurementId: 'G-HP1E8SCPTJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDie0JuXKlbNk4DBtHnNEk_g9p9vrOF-o',
    appId: '1:1043915385658:android:18c0d78dcdb41e29bc3e03',
    messagingSenderId: '1043915385658',
    projectId: 'lo-mark',
    storageBucket: 'lo-mark.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjS1YaVK7nUE7WqfR3ZIy-4zdcqQtKfk0',
    appId: '1:1043915385658:ios:74eb285afcf23130bc3e03',
    messagingSenderId: '1043915385658',
    projectId: 'lo-mark',
    storageBucket: 'lo-mark.appspot.com',
    iosBundleId: 'com.example.lomark',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjS1YaVK7nUE7WqfR3ZIy-4zdcqQtKfk0',
    appId: '1:1043915385658:ios:74eb285afcf23130bc3e03',
    messagingSenderId: '1043915385658',
    projectId: 'lo-mark',
    storageBucket: 'lo-mark.appspot.com',
    iosBundleId: 'com.example.lomark',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDtX_nkagHaC14oJMxGmeHCrY0FDzo_UE4',
    appId: '1:1043915385658:web:45f310f6cedba601bc3e03',
    messagingSenderId: '1043915385658',
    projectId: 'lo-mark',
    authDomain: 'lo-mark.firebaseapp.com',
    storageBucket: 'lo-mark.appspot.com',
    measurementId: 'G-TKF1K272VK',
  );
}
