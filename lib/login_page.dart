import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(66, 74, 89, 0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://agportal.agapesistemas.com.br/Banner?id=50&pfdrid_c=false&uid=6658b466-4839-490a-a5a2-8d232ac8f022',
            height: 300,
            width: 300,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55),
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Portal Do Servidor',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    maxLength: 14,
                    keyboardType: TextInputType.number,
                    controller: cpfController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        // icon: Icon(Icons.mail),
                        prefixIcon: Icon(Icons.mail),
                        suffixIcon: cpfController.text.isEmpty
                            ? Text('')
                            : GestureDetector(
                                onTap: () {
                                  cpfController.clear();
                                },
                                child: Icon(Icons.close)),
                        hintText: '000.000.000-00',
                        labelText: 'CPF',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1))),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: isVisible,
                    controller: passwordController,
                    onChanged: (value) {
                      print(value);
                    },
                    //
                    decoration: InputDecoration(
                        // icon: Icon(Icons.mail),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintText: 'Digite sua senha',
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1))),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: Text('Você entrou com '),
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.mail),
                                    title: Text(cpfController.text.toString()),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.lock),
                                    title: Text(
                                        passwordController.text.toString()),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Text('Entrar'),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
