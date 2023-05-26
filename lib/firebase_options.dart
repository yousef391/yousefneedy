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
    apiKey: 'AIzaSyDJjngzd4O6L-85FdhyMM0lvCNBy6Bfl3o',
    appId: '1:770853893628:web:31eb502a632faab76cae79',
    messagingSenderId: '770853893628',
    projectId: 'cpi-547ee',
    authDomain: 'cpi-547ee.firebaseapp.com',
    storageBucket: 'cpi-547ee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAszWqo_ULNkwBGoFnYuOAGcWjNAUh-nKc',
    appId: '1:770853893628:android:419a11df5f6001fa6cae79',
    messagingSenderId: '770853893628',
    projectId: 'cpi-547ee',
    storageBucket: 'cpi-547ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBU5mV9IQGKlYFhLRCu3-0r4wJDKimLGOw',
    appId: '1:770853893628:ios:183523e4e9052a1f6cae79',
    messagingSenderId: '770853893628',
    projectId: 'cpi-547ee',
    storageBucket: 'cpi-547ee.appspot.com',
    androidClientId: '770853893628-cv3svih5niciokk5bt2flucgvae24k5v.apps.googleusercontent.com',
    iosClientId: '770853893628-7t057fliv6a6bih961rhfaccjchdout1.apps.googleusercontent.com',
    iosBundleId: 'com.example.myProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBU5mV9IQGKlYFhLRCu3-0r4wJDKimLGOw',
    appId: '1:770853893628:ios:183523e4e9052a1f6cae79',
    messagingSenderId: '770853893628',
    projectId: 'cpi-547ee',
    storageBucket: 'cpi-547ee.appspot.com',
    androidClientId: '770853893628-cv3svih5niciokk5bt2flucgvae24k5v.apps.googleusercontent.com',
    iosClientId: '770853893628-7t057fliv6a6bih961rhfaccjchdout1.apps.googleusercontent.com',
    iosBundleId: 'com.example.myProject',
  );
}