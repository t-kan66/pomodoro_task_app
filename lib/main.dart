import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('flavor');
  print('flavor: $flavor');

  await Firebase.initializeApp().then((value) {
    log('Firebase.initializeApp() completed ${value.options.appId}');
  });

  runApp(const MyApp());
}
