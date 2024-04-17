import 'package:flutter/material.dart';
import 'package:heroesapp/core/injectconfig.dart';
import 'package:heroesapp/myapp.dart';

void main() {
  InjectConfig.injectDependencies();
  runApp(const MyApp());
}
