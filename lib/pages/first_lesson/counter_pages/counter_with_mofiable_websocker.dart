import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/data/socket_client.dart';

final webSocketProvider = Provider<WebsocketClient>((ref) => FakeWebsocket());

// * How can we pass something into a provider?
// * Until now, every single provider we've taken a look at always contained
//   everything it needed, we never needed to pass in values.
// * This is exactly what the so-called family modifier is for!

// * By the way, we can use MULTIPLE MODIFIERS on a single PROVIDER
// * So, we can make our providers both autoDispose and family at the same time

// * So we're going to make our stream provider into a family
// * The two type parameters:
//                first one is the type of stream
//                second one is the type that we want to pass in
final counterStreamProvider = StreamProvider.autoDispose.family<int, int>(
  (ref, initValue) {
    final webSocketClient = ref.watch(webSocketProvider);
    return webSocketClient.getCounterStream(initValue);
  },
);

final txtController = StateProvider((ref) => TextEditingController());
final initValueProvider = StateProvider.autoDispose((ref) => 0);

// * In order to get access to providers, we need to make our widgets into ConsumerWidget
class CounterPageWithModifiableWebSocket extends ConsumerWidget {
  const CounterPageWithModifiableWebSocket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initValue = ref.watch(initValueProvider);
    final AsyncValue<int> counter = ref.watch(counterStreamProvider(initValue));
    // final Stream<int> counter = ref.watch(counterStreamProvider.stream);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('COUNTER WITH WEBSOCKET'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                'Enter the starting point',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: ref.read(txtController),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                cursorWidth: 4,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.amberAccent,
                ),
                onSubmitted: (txt) {
                  ref.read(initValueProvider.notifier).state = int.tryParse(ref.read(txtController).text) ?? 0;
                  ref.read(txtController.notifier).state.text = '0';
                },
              ),
              Expanded(
                child: Center(
                  child: FittedBox(
                    child: Text(
                      counter.when(
                            data: (int value) => value,
                            error: (Object e, _) => e,
                            loading: () => initValue,
                          ).toString(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
