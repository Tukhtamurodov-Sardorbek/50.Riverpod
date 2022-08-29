import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * The basic standard Provider (myStringProvider) is read only, we can't modify its value from outside
// * But we want to be able to increment the integer, when a user presses floating action button
// * So, it's not going to be just a provider, but another type of provider: StateProvider

final counterProvider = StateProvider((ref) => 0);

// * In order to get access to providers, we need to make our widgets into ConsumerWidget
class CounterPagePreserveState extends ConsumerWidget {
  const CounterPagePreserveState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * We can use the ref, to obtain like watch/read/listen/invalidate/reset individual providers

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'floatingActionButton1',
              // * notifier => manages the state, exposes state, which is mutable
              // * If we mutate the notifier's state, it's going to mutate the actual state held in provider
              // * So, we can modify providers' values through the notifier's state...
              onPressed: () => ref.read(counterProvider.notifier).state--,
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              heroTag: 'floatingActionButton2',
              // backgroundColor: Theme.of(context).primaryColor,
              // foregroundColor: Colors.black,
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: const Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}
