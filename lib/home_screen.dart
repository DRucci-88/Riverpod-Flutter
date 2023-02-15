import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final name = ref.watch(nameProvider);
    final nameRead = ref.read(nameProvider); // one time only
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(name),
            Text(nameRead),
          ],
        ),
      ),
    );
  }
}
