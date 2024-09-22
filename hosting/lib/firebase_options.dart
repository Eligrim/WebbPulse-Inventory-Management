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
    apiKey: 'AIzaSyCfuCeuVvzNACjrdAcU9Du2alTChRPOwyE',
    appId: '1:1096617861007:web:10521cc4508cf0659a75fa',
    messagingSenderId: '1096617861007',
    projectId: 'webbpulse-inventory-management',
    authDomain: 'webbpulse-inventory-management.firebaseapp.com',
    storageBucket: 'webbpulse-inventory-management.appspot.com',
    measurementId: 'G-RY9KW16EHX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_p2XpMAoJJqiTM3PVUFKPKbITun6-XCI',
    appId: '1:1096617861007:android:8292932c105fdee29a75fa',
    messagingSenderId: '1096617861007',
    projectId: 'webbpulse-inventory-management',
    storageBucket: 'webbpulse-inventory-management.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkI9tUc19_jKU2ldIyxrPocUNiq0meBIk',
    appId: '1:1096617861007:ios:e3021b69f66cd37d9a75fa',
    messagingSenderId: '1096617861007',
    projectId: 'webbpulse-inventory-management',
    storageBucket: 'webbpulse-inventory-management.appspot.com',
    iosBundleId: 'com.webbpulse.inventory',
  );

}