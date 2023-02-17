import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamNum = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Stream'),
      ),
      body: streamNum.when(
        data: (data) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(data.toString()),
                ],
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
      ),
    );
  }
}
