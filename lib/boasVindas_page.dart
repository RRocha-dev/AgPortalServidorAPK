import 'dart:io';

import 'package:agportalservidorapk/content_login/home_page.dart';
import 'package:agportalservidorapk/content_login/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'content_login/login_page.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({Key? key}) : super(key: key);

  @override
  _BoasVindasPageState createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {
  @override
  void initState() {
    super.initState();
    verificarToken().then(
      (value) async {
        if (false) {
          // sleep(Duration(seconds: 3));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          sleep(Duration(seconds: 5));
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
