// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<void> setSessionPersistence() async {
  final auth = FirebaseAuth.instance;

  // Forzar que la sesión dure solo mientras la app esté abierta
  await auth.setPersistence(Persistence.SESSION);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
