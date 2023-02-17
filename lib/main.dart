import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/family_screen.dart';
import 'package:riverpod_learning/logger_riverpod.dart';
import 'package:riverpod_learning/navigation_screen.dart';
import 'package:riverpod_learning/provider_screen.dart';
import 'package:riverpod_learning/provider_screen_1.dart';
import 'package:riverpod_learning/future_screen.dart';
import 'package:riverpod_learning/data/user.dart';
import 'package:riverpod_learning/data/user_future.dart';
import 'package:riverpod_learning/stream_screen.dart';
import 'package:riverpod_learning/user_repository.dart';

/// Providers:
/// 1. Provider
///   -> Read-Only Provider
///   -> Maybe good for constant value across entire apps
/// 2. StateProvider
///   -> Simple Provider
///   -> Good for update a simple value
///   -> Rare to use cause apps usualy have a complex data and need its provider
/// 3. StateNotifier and StateNotifierProvider
///   -> Best Approuch for complex state
/// 4. ChangeNotifier and ChangeNotifierProvider
///   -> Only transition from Provider to Riverpod
///   -> Backward compatible for user that use Provider state management
///   -> Not recomended by Riverpod docs to use this anymore
///   -> Do not have access to data model and state
///   -> Use notifyListeners(); inside method to update UI.
///   -> This provider is MUTABLE (very bad), it can change its property outside the class
/// 5. Future Provider
///   -> Provider based on async code
///   -> Replacement for FutureBuilder provided by Riverpod
/// 6. Stream Provider
///   -> Return stream
///   -> Replacement for StreamBuildeer provided by Riverpod

/// Provider Observer
///   -> Observe all providers lifecycle (remove, added, listen, etc)
///   -> Use for loggin and dev tools for Riverpod environment
///   -> It is like parent class for all providers
///   -> Provider Container = is what use within the provider scope

/// Modifiers:
/// Genererics type of provider
/// 1. Family
///   -> Extends use of other provider that treated provider like a function
///   -> Limitation: only 1 input parameter
///   -> There are time when input never change
///   -> There are time when input can be changed but never reuse
/// 2. autoDispose
///   -> Avoid memory leak in app whenever provider not used anymore
///   -> Better use for provider only by event like Stream Subcription etc.

/// AsyncValue
///   -> Better version / Replacement of AsyncSnapshot
///   -> Problem with AsyncSnapshot:
///   -> snapshot.data, snapshot.error they are not interconnected with each other
/// Ref
///   -> Super class for WidgetRef and ProviderRef
///   -> Can be used to other class that need ref
/// WidgetRef
///   -> Allow us talk from widget to provider
/// ProfiderRef
///   -> Allow us talk from provider to another provider
/// ProviderRef.keepAlive
///   -> Used under autoDispose modifiers
///   -> Whenever provider dispose and u want to preserve tha state of its provider
///   -> and make sure the state is still there
/// ref.onDispose
///   -> run something after dispose
/// ref.onCancel
///   -> run something after no longer being used anytime
/// ref.OnResume
///   -> run something after used again
/// ref.onAddListener and ref.onRemoveListeners
///

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

final streamProvider = StreamProvider((ref) async* {
  for (var i = 0; i < 10; i++) {
    yield await Future.delayed(
      const Duration(seconds: 1),
      () {
        return i;
      },
    );
  }
});

final fetchUserProviderFamily = FutureProvider.family((ref, String n) {
  return ref.watch(userRepositoryProvider).fetchUserDataPagination('1');
});

final a = FutureProviderFamily<UserFuture, String>((ref, arg) => UserFuture(
    id: 1,
    name: 'rucci',
    username: 'username',
    email: 'email',
    phone: 'phone'));

void main() {
  runApp(ProviderScope(
    observers: [
      LoggerRiverpod(),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = [
      NavigationRouterScreen(title: 'Provider', screen: const ProviderScreen()),
      NavigationRouterScreen(title: 'Future', screen: const FutureScreen()),
      NavigationRouterScreen(title: 'Stream', screen: const StreamScreen()),
      NavigationRouterScreen(title: 'Family', screen: const FamilyScreen())
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ProviderScreen(),
      // home: const ProviderScreen1(),
      // home: const FutureScreen(),
      // home: const StreamScreen(),
      home: NavigationScreen(router: router),
    );
  }
}
