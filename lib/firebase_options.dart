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
    apiKey: 'AIzaSyDXcS1lKX70gw388QY6pZO5JPuyjRN0DwE',
    appId: '1:906206889213:web:ce267236e99d3db8d62a94',
    messagingSenderId: '906206889213',
    projectId: 'medical-advice-ap',
    authDomain: 'medical-advice-ap.firebaseapp.com',
    storageBucket: 'medical-advice-ap.appspot.com',
    measurementId: 'G-PK3Y61FGBS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzR3HXWYvzVJ645yKpHGNSUGbRUcfWYKc',
    appId: '1:906206889213:android:766245df83a3187cd62a94',
    messagingSenderId: '906206889213',
    projectId: 'medical-advice-ap',
    storageBucket: 'medical-advice-ap.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAl6nKR138TF2OHIbelSJrhZdZF6rJiE0s',
    appId: '1:906206889213:ios:a3e6a5fdb2fe4e26d62a94',
    messagingSenderId: '906206889213',
    projectId: 'medical-advice-ap',
    storageBucket: 'medical-advice-ap.appspot.com',
    iosClientId: '906206889213-el7bigt8jkbnp599mgale353b7rtvscm.apps.googleusercontent.com',
    iosBundleId: 'com.example.doctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAl6nKR138TF2OHIbelSJrhZdZF6rJiE0s',
    appId: '1:906206889213:ios:a3e6a5fdb2fe4e26d62a94',
    messagingSenderId: '906206889213',
    projectId: 'medical-advice-ap',
    storageBucket: 'medical-advice-ap.appspot.com',
    iosClientId: '906206889213-el7bigt8jkbnp599mgale353b7rtvscm.apps.googleusercontent.com',
    iosBundleId: 'com.example.doctor',
  );
}