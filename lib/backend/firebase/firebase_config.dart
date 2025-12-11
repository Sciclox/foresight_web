import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDxJNvOzCCWlVVPypFfMvoXh6vLbOkAbkI",
            authDomain: "pe-pacasmayo-f5-gcp-dev.firebaseapp.com",
            projectId: "pe-pacasmayo-f5-gcp-dev",
            storageBucket: "pe-pacasmayo-f5-gcp-dev.firebasestorage.app",
            messagingSenderId: "965349718230",
            appId: "1:965349718230:web:4ca5ca18e61e5552f37177"));
  } else {
    await Firebase.initializeApp();
  }
}
