import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:should_todo/should_todo_app.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Remove Splash Screen After 2 Seconds
  FlutterNativeSplash.remove();
  runApp(const ShouldToDo());
}

Future initialization(BuildContext? context) async {
//  load resources
  await Future.delayed(const Duration(seconds: 2));
}
