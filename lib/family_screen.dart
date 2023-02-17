import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class FamilyScreen extends ConsumerStatefulWidget {
  const FamilyScreen({super.key});

  @override
  ConsumerState<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends ConsumerState<FamilyScreen> {
  String userNumber = '1';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProviderFamily(userNumber));

    return Scaffold(
      appBar: AppBar(
        title: Text('Family - User $userNumber'),
      ),
      body: user.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('User Number'),
                  ),
                  onSubmitted: (value) => setState(() => userNumber = value),
                ),
                const SizedBox(height: 10),
                Text(data.name),
                const SizedBox(height: 10),
                Text(data.email),
              ],
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
      ),
    );
  }
}
