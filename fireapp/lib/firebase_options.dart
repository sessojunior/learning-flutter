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
    apiKey: 'AIzaSyDzCF5xheNUpriNiQBCllugnzGo75H3hmE',
    appId: '1:890465634864:web:a0247c3b65591d11c17bf5',
    messagingSenderId: '890465634864',
    projectId: 'fireapp-a7a18',
    authDomain: 'fireapp-a7a18.firebaseapp.com',
    storageBucket: 'fireapp-a7a18.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1Q6cuPADEZRRVxXDJ1Z57FD-6OWqdVdM',
    appId: '1:890465634864:android:d67bb9bf905556cbc17bf5',
    messagingSenderId: '890465634864',
    projectId: 'fireapp-a7a18',
    storageBucket: 'fireapp-a7a18.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvjxJa5hrZMN0BgWv07qmbtwJL3fzRI8k',
    appId: '1:890465634864:ios:cb7fbdb35118f96bc17bf5',
    messagingSenderId: '890465634864',
    projectId: 'fireapp-a7a18',
    storageBucket: 'fireapp-a7a18.firebasestorage.app',
    iosBundleId: 'br.com.sessojunior.fireapp.fireapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvjxJa5hrZMN0BgWv07qmbtwJL3fzRI8k',
    appId: '1:890465634864:ios:cb7fbdb35118f96bc17bf5',
    messagingSenderId: '890465634864',
    projectId: 'fireapp-a7a18',
    storageBucket: 'fireapp-a7a18.firebasestorage.app',
    iosBundleId: 'br.com.sessojunior.fireapp.fireapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDzCF5xheNUpriNiQBCllugnzGo75H3hmE',
    appId: '1:890465634864:web:c428ee2abb1dc705c17bf5',
    messagingSenderId: '890465634864',
    projectId: 'fireapp-a7a18',
    authDomain: 'fireapp-a7a18.firebaseapp.com',
    storageBucket: 'fireapp-a7a18.firebasestorage.app',
  );

}