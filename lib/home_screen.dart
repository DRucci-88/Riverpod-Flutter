import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';
import 'package:riverpod_learning/user.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Widget sb() => const SizedBox(height: 10);

  void onSubmitName(WidgetRef ref, String value) {
    ref.read(nameStateProvider.notifier).update((state) => value);
  }

  void onSubmitUserName(WidgetRef ref, String value) {
    ref.read(userNotifierProvider.notifier).updateName(value);
  }

  void onSubmitUserAge(WidgetRef ref, int value) {
    ref.read(userNotifierProvider.notifier).updateAge(value);
  }

  void onSubmitUserNameNotifier(WidgetRef ref, String value) {
    ref.read(userChangeNotifierProvider).updateName(value);
  }

  void onSubmitUserAgeNotifier(WidgetRef ref, int value) {
    ref.read(userChangeNotifierProvider).updateAge(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    final String name = ref.watch(nameProvider);

    /// Read-Only
    /// one time only and better inside initState
    final String nameRead = ref.read(nameProvider);

    /// Simple Provider
    final String nameState = ref.watch(nameStateProvider) ?? "Null";

    /// Complex provider
    final User user = ref.watch(userNotifierProvider);

    /// Complex Provider
    /// But only selected one property that change and can trigger rebuild UI
    final String userName = ref.watch(userNotifierProvider.select(
      (value) => value.name,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(nameRead),
      ),
      body: Center(
        child: Column(
          children: [
            Text(name),
            sb(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Name'),
              ),
              onSubmitted: (value) => onSubmitName(ref, value),
            ),
            sb(),
            Text(nameState),
            sb(),

            /// State Notifier
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('User Name'),
              ),
              onSubmitted: (value) => onSubmitUserName(ref, value),
            ),
            sb(),
            Text(user.name.toString()),
            sb(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('User Age'),
              ),
              onSubmitted: (value) => onSubmitUserAge(ref, int.parse(value)),
            ),
            sb(),
            Text(user.age.toString()),

            /// Change Notifier
            sb(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('User Name Change Notifier'),
              ),
              onSubmitted: (value) => onSubmitUserNameNotifier(ref, value),
            ),
            sb(),
            Text(user.name.toString()),
            sb(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('User Age Change Notifier'),
              ),
              onSubmitted: (value) =>
                  onSubmitUserAgeNotifier(ref, int.parse(value)),
            ),
            sb(),
            Text(user.age.toString()),
          ],
        ),
      ),
    );
  }
}
