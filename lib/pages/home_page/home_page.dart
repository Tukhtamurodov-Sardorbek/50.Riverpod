import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/pages/counter_pages/counter_page_preserve.dart';
import 'package:riverpod_learning/pages/counter_pages/counter_page_auto_dispose.dart';
import 'package:riverpod_learning/pages/counter_pages/counter_page_dispose_manually.dart';
import 'package:riverpod_learning/pages/counter_pages/counter_page_with_alerts.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
              child: const Text('COUNTER PAGE AUTO-DISPOSE STATE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const CounterPageAutoDisposeState()),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('COUNTER PAGE DISPOSE STATE MANUALLY'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                            (BuildContext context) => const CounterPageManuallyDisposeState()
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('COUNTER PAGE WITH ALERT'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                            (BuildContext context) => const CounterPageWithAlert()
                    ),
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
