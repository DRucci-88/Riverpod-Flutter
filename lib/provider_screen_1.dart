import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class ProviderScreen1 extends StatelessWidget {
  const ProviderScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Center(
            child: Column(
              children: [
                Text(name),
              ],
            ),
          );
        },
      ),
    );
  }
}
