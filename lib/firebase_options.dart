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
    apiKey: 'AIzaSyATz2Dz7HnT6qzItf25JyL_fQ4DM9Cu3fw',
    appId: '1:626709830026:web:cf4ddc48f45c634f721073',
    messagingSenderId: '626709830026',
    projectId: 'social-media-ce401',
    authDomain: 'social-media-ce401.firebaseapp.com',
    storageBucket: 'social-media-ce401.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdrOd_pF5I9MJrDxBRvLILPO_TmHypFfA',
    appId: '1:626709830026:android:6b514fe2fe6b4d83721073',
    messagingSenderId: '626709830026',
    projectId: 'social-media-ce401',
    storageBucket: 'social-media-ce401.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPDoAqIJjA70TfJNeyvfqa1rX_H2Zjfws',
    appId: '1:626709830026:ios:ee6c407de9826558721073',
    messagingSenderId: '626709830026',
    projectId: 'social-media-ce401',
    storageBucket: 'social-media-ce401.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPDoAqIJjA70TfJNeyvfqa1rX_H2Zjfws',
    appId: '1:626709830026:ios:ee6c407de9826558721073',
    messagingSenderId: '626709830026',
    projectId: 'social-media-ce401',
    storageBucket: 'social-media-ce401.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyATz2Dz7HnT6qzItf25JyL_fQ4DM9Cu3fw',
    appId: '1:626709830026:web:9916ac3999093526721073',
    messagingSenderId: '626709830026',
    projectId: 'social-media-ce401',
    authDomain: 'social-media-ce401.firebaseapp.com',
    storageBucket: 'social-media-ce401.appspot.com',
  );

}