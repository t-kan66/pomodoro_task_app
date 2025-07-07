import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/myapp.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('flavor');
  print('flavor: $flavor');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    log('Firebase.initializeApp() completed ${value.options.appId}');
  });

  // Initialize Firebase Analytics
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  await analytics.logAppOpen();
  log('Firebase Analytics initialized for flavor: $flavor');

  runApp(const ProviderScope(child: MyApp()));
}
