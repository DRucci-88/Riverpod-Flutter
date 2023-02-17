import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/data/user_future.dart';
import 'package:riverpod_learning/main.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  Widget sb() => const SizedBox(height: 10);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider).value;

    final users = ref.watch(fetchListUserProvider);
    return users.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Future Provider and so on'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  sb(),
                  showUser(user!),
                  sb(),
                  const Divider(thickness: 10, color: Colors.blue),
                  ...data.map((e) => showUser(e)).toList()
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget showUser(UserFuture user) {
    return ListTile(title: Text(user.name), subtitle: Text(user.username));
  }
}
