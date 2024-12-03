import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/app.dart';
import 'package:instagram_clone_flutter/firebase_options.dart';


void main() async {
  // firebase setup

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // run app
  runApp( MyApp());
}

