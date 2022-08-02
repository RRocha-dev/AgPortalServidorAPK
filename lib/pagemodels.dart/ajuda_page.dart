
import 'package:flutter/material.dart';

import '../pageviewnavigation.dart';


class AjudaPage extends StatefulWidget {
  AjudaPage({Key? key}) : super(key: key);

  @override
  State<AjudaPage> createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Stack(children: [
            
            Padding(
              padding: EdgeInsets.fromLTRB(_size.width * 0.00, _size.height * 0.05, 0, 0),
              child: menudraw(),
            )
          ]),
        ));
  }
}