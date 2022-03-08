import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter/src/painting/image_provider.dart';

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
          Container(
            height: 300,
            width: 300,
            child: Padding(padding: EdgeInsets.all(110),
            child: Image.network(
              'https://agportal.agapesistemas.com.br/resources/agape/imgs/logo-agape.png',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),)
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
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
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
                    validator: (String? cpf) {
                      if(cpf == null || cpf.isEmpty){
                        return "CPF obrigatório!";
                      }
                      return "Ok";
                    },
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

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Text('Entrar'),
                      )),

                     Padding(padding: EdgeInsets.fromLTRB(5, 100, 5, 2), child: Column(
                       children: [
                         Row(
                           children: [
                             InkWell(
                                onTap: (){

                                },
                               child: Container(

                                 child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/640px-Instagram_icon.png',
                                   fit: BoxFit.fill,),
                                 width: 32,
                                 height: 32,
                               ),
                             )
                           ],
                         ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:  Row(
                          children: [
                            Icon(Icons.copyright_sharp),
                            Expanded(
                                flex: 2,
                                child:  Text('Todos os direitos reservados a Ágape Sistemas e Tecnologias',))

                          ],
                        ),)
                       ],
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
