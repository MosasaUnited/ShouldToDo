import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:should_todo/should_todo_app.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Instantiate Shared Preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Remove Splash Screen After 2 Seconds
  FlutterNativeSplash.remove();

  runApp(
    const ShouldToDo(),
  );
}

Future initialization(BuildContext? context) async {
//  load resources
  await Future.delayed(const Duration(seconds: 2));
}
