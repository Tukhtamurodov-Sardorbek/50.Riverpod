import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/pages/second_lesson/viewModel.dart';

final viewModel = ChangeNotifierProvider<CounterProvider>(
      (ref) => CounterProvider(),
);

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taps = ref.watch(viewModel).taps;
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            ref.read(viewModel).incrementTaps();
          },
          child: Text('Taps: $taps'),
        ),
      ),
    );
  }
}

