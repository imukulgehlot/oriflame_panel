import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/my_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializingInitials();
  runApp(MyApp());
}

Future<void> initializingInitials() async {
   await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform);
}
