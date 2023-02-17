import 'package:flutter/material.dart';

class NavigationRouterScreen {
  final String title;
  final Widget screen;
  NavigationRouterScreen({
    required this.title,
    required this.screen,
  });
}

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.router});
  final List<NavigationRouterScreen> router;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation ')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...router.map((e) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return e.screen;
                      },
                    ));
                  },
                  child: Text(e.title),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
