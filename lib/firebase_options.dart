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
    apiKey: 'AIzaSyCO4DOj0CiEfIBxHHXJF-eEAujCUn9dTyU',
    appId: '1:3213774898:web:9f6e99d11e85e37b6e6c2b',
    messagingSenderId: '3213774898',
    projectId: 'shcool-ade9e',
    authDomain: 'shcool-ade9e.firebaseapp.com',
    storageBucket: 'shcool-ade9e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmw8tgD6PObWeHlcHvHZkoFbO7dzZKo3E',
    appId: '1:3213774898:android:efe9df2bb744c4926e6c2b',
    messagingSenderId: '3213774898',
    projectId: 'shcool-ade9e',
    storageBucket: 'shcool-ade9e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnpiLBhoGi6lRJUNoV-h23lvHA5mEUEi0',
    appId: '1:3213774898:ios:458cec674143c33a6e6c2b',
    messagingSenderId: '3213774898',
    projectId: 'shcool-ade9e',
    storageBucket: 'shcool-ade9e.appspot.com',
    iosBundleId: 'com.example.shcool',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnpiLBhoGi6lRJUNoV-h23lvHA5mEUEi0',
    appId: '1:3213774898:ios:458cec674143c33a6e6c2b',
    messagingSenderId: '3213774898',
    projectId: 'shcool-ade9e',
    storageBucket: 'shcool-ade9e.appspot.com',
    iosBundleId: 'com.example.shcool',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCO4DOj0CiEfIBxHHXJF-eEAujCUn9dTyU',
    appId: '1:3213774898:web:7ae166471bb1a3f96e6c2b',
    messagingSenderId: '3213774898',
    projectId: 'shcool-ade9e',
    authDomain: 'shcool-ade9e.firebaseapp.com',
    storageBucket: 'shcool-ade9e.appspot.com',
  );
}
