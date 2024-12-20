import 'package:flutter/material.dart';

import 'app/myapp.dart';

void main() {
  const flavor = String.fromEnvironment('flavor');
  print('flavor: $flavor');

  runApp(const MyApp());
}
