import 'package:flutter/material.dart';
import 'package:riverpod_learning/pages/simple/counter_pages/counter_with_alerts.dart';
import 'package:riverpod_learning/pages/simple/counter_pages/counter_with_auto_disposable_state.dart';
import 'package:riverpod_learning/pages/simple/counter_pages/counter_with_dispose_manually.dart';
import 'package:riverpod_learning/pages/simple/counter_pages/counter_with_mofiable_websocker.dart';
import 'package:riverpod_learning/pages/simple/counter_pages/counter_with_preservable_state.dart';
import 'package:riverpod_learning/pages/simple/counter_pages/counter_with_websocket.dart';

class FirstLessonMainPage extends StatelessWidget {
  const FirstLessonMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SIMPLE USE CASES'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: const FittedBox(
                  child: Text('COUNTER WITH PRESERVABLE STATE'),
              ),
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
              child: const FittedBox(
                child: Text('COUNTER WITH AUTO-DISPOSABLE STATE'),
              ),
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
              child: const FittedBox(
                child: Text('COUNTER WITH MANUALLY DISPOSED STATE'),
              ),
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
            const Divider(thickness: 3),
            ElevatedButton(
              child: const FittedBox(
                child: Text('COUNTER WITH ALERT'),
              ),
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
            ElevatedButton(
              child: const FittedBox(
                child: Text('COUNTER WITH WEBSOCKET'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                            (BuildContext context) => const CounterPageWithWebSocket()
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const FittedBox(
                child: Text('COUNTER WITH MODIFIABLE WEBSOCKET'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                            (BuildContext context) => const CounterPageWithModifiableWebSocket()
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
