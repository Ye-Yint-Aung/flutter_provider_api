import 'package:api_test/provider/news_provider.dart';
import 'package:api_test/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.highContrastLight(),
          /* ColorScheme.fromSeed(seedColor: Colors.deepPurple), */
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
