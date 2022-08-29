import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * The basic standard Provider (myStringProvider) is read only, we can't modify its value from outside
// * But we want to be able to increment the integer, when a user presses floating action button
// * So, it's not going to be just a provider, but another type of provider: StateProvider

final counterProvider = StateProvider((ref) => 0);

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // *
    final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COUNTER'),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Theme.of(context).primaryColor,
        // foregroundColor: Colors.black,
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
