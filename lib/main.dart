import 'package:flutter/material.dart';

import 'boasVindas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal do Servidor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Color.fromRGBO(71, 66, 131, 1),00
          ),
      home: const BoasVindasPage(),
    );
  }
}
