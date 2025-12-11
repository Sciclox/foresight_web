// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> googleSignInWebExistingOnly() async {
  try {
    // 1. Configura el provider de Google
    final GoogleAuthProvider googleProvider = GoogleAuthProvider();

    // 2. Abre el popup de Google e inicia sesión
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // 3. Obtén el UID del usuario de Firebase Auth
    String uid = userCredential.user!.uid; // <-- Usa el UID

    // 4. Busca el usuario en tu colección de FlutterFlow (Firestore) usando el UID
    final userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get(); // <-- Buscar por UID

    if (userDoc.exists) {
      // Usuario existe → login permitido
      return "success";
    } else {
      // Usuario no existe → cancelar login
      // Desloguea el usuario que Firebase Auth creó automáticamente
      await FirebaseAuth.instance.signOut();
      return "not_registered";
    }
  } catch (e) {
    // Detecta si el usuario cerró el popup o canceló
    if (e.toString().contains('popup-closed-by-user')) {
      return "cancelled";
    }
    // Para otros errores (ej. fallo de red, configuracion), devolver el error
    return "error:${e.toString()}";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
