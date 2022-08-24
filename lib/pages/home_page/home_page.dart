import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/pages/counter_page/counter_page.dart';

// * If we want to provide a string throughout the app using riverpod
// * Keep in mind! The object being provided by the provider is called state
// * The global nature of the provider declaration but the provider itself not being global
// * Declaration is Global, but the variable/state is NOT Global
// * We can use this variable anywhere and get to its state from anywhere

final myStringProvider = Provider((ref) => 'Hello World!');

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('COUNTER PAGE'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: ((BuildContext context) => const CounterPage())));
          },
        )
      ),
    );
  }
}
