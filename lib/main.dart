import 'package:flutter/material.dart';
import 'package:my_first_api/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'API Rick and Morty ',
      home: Home(),
      debugShowCheckedModeBanner: false,//quitar banner de debug
    );
  }
}
