import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * We cannot just come into a build method and start navigating
//   or showing alerts/snack bars, because we'll get an error
//   setState or mark needs build called during build, basically it's just
//   impossible. So we need to put the snckBar showing or alert showing into
//   a separate function, which is run after the build has finished,
//   so therefore using watch isn't possible, instead what we can use is listen

// * build function is not good place to run our logic, which needs to run only
//   one time per state change. Logic written in build can actually run
//   multiple times, because build function can run up to 60 times a second and
//   even more, if we're using some animations. So we cannot rely on the fact
//   that if statement will just run once insidde a build function!

// * So, every logic should happen inside listen, when we are working with
//   providers and we need to run some logic or show dialogs

final counterWithAlertProvider = StateProvider((ref) => 0);


class CounterPageWithAlert extends ConsumerWidget {
  const CounterPageWithAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterWithAlertProvider);

    // * listen => continuously listens, but instead of putting the value into
    //   a variable like watch, we're going to receive values inside callback
    ref.listen<int>(
      counterWithAlertProvider,
      (previous, current) {
        if (current >= 5) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Warning', textAlign: TextAlign.center),
                  content: const Text(
                    '''Counter dangerously high (😂) \nConsider resetting it...''',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              });
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COUNTER WITH ALERT'),
        actions: [
          IconButton(
            onPressed: (){
              ref.refresh(counterWithAlertProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
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
              onPressed: () => ref.read(counterWithAlertProvider.notifier).state--,
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              heroTag: 'floatingActionButton2',
              // backgroundColor: Theme.of(context).primaryColor,
              // foregroundColor: Colors.black,
              onPressed: () => ref.read(counterWithAlertProvider.notifier).state++,
              child: const Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}
