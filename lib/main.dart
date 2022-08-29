import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/pages/home_page/home_page.dart';

// * ProviderScope - is the only widget which wraps smth in Riverpod
// * Everything is properly managed by the ProviderScope
void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
        brightness: Brightness.dark,
      ),

      home: const HomePage(),
    );
  }
}