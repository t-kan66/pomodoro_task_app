import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/myapp.dart';
import 'firebase_options_dev.dart' as dev_options;
import 'firebase_options_prod.dart' as prod_options;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('flavor');
  print('flavor: $flavor');

  final firebaseOptions =
      flavor == 'prod' ? prod_options.DefaultFirebaseOptions.currentPlatform : dev_options.DefaultFirebaseOptions.currentPlatform;

  await Firebase.initializeApp(options: firebaseOptions).then((value) {
    log('Firebase.initializeApp() completed ${value.options.appId}');
  });

  // Firebase Analyticsの初期化
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  runApp(const ProviderScope(child: MyApp()));
}
