import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9o7Rz_FiHu8tHxLFcbk60bftogVgE2Mk",
            authDomain: "group13-83de4.firebaseapp.com",
            projectId: "group13-83de4",
            storageBucket: "group13-83de4.appspot.com",
            messagingSenderId: "127054393502",
            appId: "1:127054393502:web:f08cccfc96c1c5daff8b8f"));
  } else {
    await Firebase.initializeApp();
  }
}
