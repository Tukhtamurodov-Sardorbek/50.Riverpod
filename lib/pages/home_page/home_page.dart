import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/pages/counter_page_preserve/counter_page.dart';
import 'package:riverpod_learning/pages/counter_page_reset/counter_page.dart';

// * If we want to provide a string throughout the app using the Riverpod:
// * Keep in mind! The object being provided by the provider is called state
// * Declaration is Global, but the variable/state is NOT Global
// * We can use this variable anywhere and get to its state from anywhere

// * This is a basic standard Provider (unmodifiable)
final myStringProvider = Provider((ref) => 'Hello World!');

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HOME'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('COUNTER PAGE PRESERVE STATE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const CounterPagePreserveState()),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('COUNTER PAGE RESET STATE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const CounterPageResetState()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
