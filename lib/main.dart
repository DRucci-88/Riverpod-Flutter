import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/provider_screen.dart';
import 'package:riverpod_learning/provider_screen_1.dart';
import 'package:riverpod_learning/future_screen.dart';
import 'package:riverpod_learning/data/user.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_learning/data/user_future.dart';
import 'package:riverpod_learning/user_repository.dart';

/// Providers
/// Provider
///   -> Read-Only Provider
///   -> Maybe good for constant value across entire apps
/// StateProvider
///   -> Simple Provider
///   -> Good for update a simple value
///   -> Rare to use cause apps usualy have a complex data and need its provider
/// StateNotifier and StateNotifierProvider
///   -> Best Approuch for complex
/// ChangeNotifier and ChangeNotifierProvider
///   -> Only transition from Provider to Riverpod
///   -> Backward compatible for user that use Provider state management
///   -> Not recomended by Riverpod docs to use this anymore
///   -> Do not have access to data model and state
///   -> Use notifyListeners(); inside method to update UI.
///   -> This provider is MUTABLE (very bad), it can change its property outside the class
/// Future Provider
///   -> Provider based on async code
///   -> Replacement for FutureBuilder provided by Riverpod

/// AsyncValue
///   -> Better version / Replacement of AsyncSnapshot
///   -> Problem with AsyncSnapshot:
///     -> snapshot.data, snapshot.error they are not interconnected with each other
/// WidgetRef
///   -> Allow us talk from widget to provider
/// ProfiderRef
///   -> Allow us talk from provide to another provider

final nameProvider = Provider<String>((ref) {
  return "rucci";
});

final nameStateProvider = StateProvider<String?>((ref) {
  return null;
});

final userNotifierProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  // return UserNotifier(const User(name: '', age: 0));
  return UserNotifier();
});

final userChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return UserNotifierProvider();
});

final fetchUserProvider = FutureProvider<UserFuture>((ref) {
  return ref.watch(userRepositoryProvider).fetchUserData();
});

final fetchListUserProvider = FutureProvider<List<UserFuture>>((ref) {
  return ref.watch(userRepositoryProvider).fetctUserListData();
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
      // home: const ProviderScreen(),
      // home: const ProviderScreen1(),
      home: const FutureScreen(),
    );
  }
}
