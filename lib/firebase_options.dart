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
    apiKey: 'AIzaSyCIpfLpgYopR3fY5HPi-veHceNom9i-JsQ',
    appId: '1:864321563249:web:81c51d9d10cc9cf0d649d0',
    messagingSenderId: '864321563249',
    projectId: 'newsappcode-81580',
    authDomain: 'newsappcode-81580.firebaseapp.com',
    storageBucket: 'newsappcode-81580.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCndrX8chq5_PYJSs9BvjDT4NMpdeJiytw',
    appId: '1:864321563249:android:91793187460b264ad649d0',
    messagingSenderId: '864321563249',
    projectId: 'newsappcode-81580',
    storageBucket: 'newsappcode-81580.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASE7y4aRn97OXimwMaW7_95hoWEpIDlsE',
    appId: '1:864321563249:ios:f198a8e12ad135c7d649d0',
    messagingSenderId: '864321563249',
    projectId: 'newsappcode-81580',
    storageBucket: 'newsappcode-81580.appspot.com',
    iosClientId:
        '864321563249-ih4cp4cqhms4kbq8423a0i605p5fe8ll.apps.googleusercontent.com',
    iosBundleId: 'com.example.appNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASE7y4aRn97OXimwMaW7_95hoWEpIDlsE',
    appId: '1:864321563249:ios:f198a8e12ad135c7d649d0',
    messagingSenderId: '864321563249',
    projectId: 'newsappcode-81580',
    storageBucket: 'newsappcode-81580.appspot.com',
    iosClientId:
        '864321563249-ih4cp4cqhms4kbq8423a0i605p5fe8ll.apps.googleusercontent.com',
    iosBundleId: 'com.example.appNew',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCIpfLpgYopR3fY5HPi-veHceNom9i-JsQ',
    appId: '1:864321563249:web:451c9815c4aa29d3d649d0',
    messagingSenderId: '864321563249',
    projectId: 'newsappcode-81580',
    authDomain: 'newsappcode-81580.firebaseapp.com',
    storageBucket: 'newsappcode-81580.appspot.com',
  );
}
