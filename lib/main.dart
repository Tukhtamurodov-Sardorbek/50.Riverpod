import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/pages/home_page/home_page.dart';

final counterProvider = StateProvider((ref) => 0);

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
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
          secondary: const Color(0xff003909),
        ),
      ),

      home: const HomePage(),
    );
  }
}