import 'package:flutter/material.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({Key? key}) : super(key: key);

  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  final _formKey = GlobalKey<FormState>;
  String? _selectedCliente;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://sitesagapesistemas.com.br/2022/app/img/bg5.jpg"))),
      ),
    );
  }
}
