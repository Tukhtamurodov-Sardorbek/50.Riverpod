import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * If we don't want to keep some expensive object forever, that takes up
//   very much memory, disposing of things whenever they are no longer used is very handy

// * In order to make the state just be reset whenever we go to the home page and then come back
//   we just use the autoDispose modifier on our StateProvider
final counterAutoDisposableProvider = StateProvider.autoDispose((ref) => 0);


// * In order to get access to providers, we need to make our widgets into ConsumerWidget
class CounterPageAutoDisposeState extends ConsumerWidget {
  const CounterPageAutoDisposeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * We can use the ref, to obtain like watch/read/listen/invalidate/reset individual providers

    final int counter = ref.watch(counterAutoDisposableProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COUNTER AUTO-DISPOSE'),
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
              onPressed: () => ref.read(counterAutoDisposableProvider.notifier).state--,
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              heroTag: 'floatingActionButton2',
              // backgroundColor: Theme.of(context).primaryColor,
              // foregroundColor: Colors.black,
              onPressed: () => ref.read(counterAutoDisposableProvider.notifier).state++,
              child: const Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}
