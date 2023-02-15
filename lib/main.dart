import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/home_screen.dart';
import 'package:riverpod_learning/home_screen_1.dart';
import 'package:riverpod_learning/user.dart';

/// Provider
/// Providers
/// StateProvider
/// StateNotifier and StateNotifierProvider
/// ChangeNotifier and ChangeNotifierProvider
///   -> Only transition from Provider to Riverpod
///   -> Backward compatible for user that use Provider state management
///   -> Not recomended by Riverpod docs to use this anymore
///   -> Do not have access to data model and state
///   -> Use notifyListeners(); inside method to update UI.
///   -> This provider is MUTABLE (very bad), it can change its property outside the class

/// Read-Only Provider
/// Maybe good for constant value across entire apps
final nameProvider = Provider<String>((ref) {
  return "rucci";
});

/// Simple Provider
/// Good for update a simple value
/// Rare to use cause apps usualy have a complex data and need its provider
final nameStateProvider = StateProvider<String?>((ref) {
  return null;
});

/// Best Approuch for complex
final userNotifierProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  // return UserNotifier(const User(name: '', age: 0));
  return UserNotifier();
});

final userChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return UserNotifierProvider();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
