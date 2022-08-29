import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/data/socket_client.dart';

final webSocketProvider = Provider<WebsocketClient>((ref) => FakeWebsocket());

final counterStreamProvider = StreamProvider<int>(
  (ref) {
    final webSocketClient = ref.watch(webSocketProvider);
    return webSocketClient.getCounterStream();
  },
);

// * In order to get access to providers, we need to make our widgets into ConsumerWidget
class CounterPageWithWebSocket extends ConsumerWidget {
  const CounterPageWithWebSocket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> counter = ref.watch(counterStreamProvider);
    // final Stream<int> counter = ref.watch(counterStreamProvider.stream);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COUNTER WITH WEBSOCKET'),
      ),
      body: Center(
        child: Text(
          counter
              .when(
                data: (int value) => value,
                error: (Object e, _) => e,
                loading: () => 0,
              )
              .toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
