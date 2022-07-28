import 'dart:convert';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'login_register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  String? _selectedAlias = '';
  List<DropdownMenuItem<String>> get dropDownItens {
    List<DropdownMenuItem<String>> menuItens = [
      DropdownMenuItem(
        child: Text('Selecione um Município'),
      ),
      DropdownMenuItem(
        child: Text('Agape'),
        value: '.agape',
      ),
    ];
    return menuItens;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    final snackBar = SnackBar(
      // backgroundColor: Color.fromRGBO(36, 148, 242, 0.5),
      backgroundColor: Colors.red,
      content: Text(
        'CPF ou Senha Incorretos!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(36, 148, 242, 0.5),
        body: FooterView(
          flex: 10,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: _size.height * 0.3,
                    // width: _size.width,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
                      child: Image.network(
                        'https://agportal.agapesistemas.com.br/resources/agape/imgs/logo-agape.png',
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Container(
                    height: _size.height * 0.56,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              'Portal Do Servidor',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            validator: (cpf) {
                              if (cpf == null || cpf.isEmpty) {
                                return "CPF obrigatório!";
                              } else if (cpf.length < 14) {
                                return "Favor digite um CPF Valido";
                              }
                              return null;
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
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1))),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            obscureText: isVisible,
                            controller: passwordController,
                            onChanged: (value) {
                              //print(value);
                            },
                            validator: (senha) {
                              if (senha == null || senha.isEmpty) {
                                return 'Senha Obrigatória!';
                              }
                              return null;
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
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1))),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Esqueceu sua senha?'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginRegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Text('Cadastre-se'))
                              ],
                            ),
                            height: 50,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Selecione um Cliente",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: DropdownButtonFormField(
                                          items: dropDownItens,
                                          onChanged: (String? newValue) {
                                            _selectedAlias =
                                                newValue.toString();
                                          },
                                          validator: (cliente) {
                                            if (cliente == null ||
                                                cliente == '') {
                                              return 'Favor Selecione um Cliente!';
                                            }
                                          },
                                        ),
                                        elevation: 2,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: Text('Voltar'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              if (_selectedAlias != null &&
                                                  _selectedAlias != '') {
                                                bool ok = await login();
                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                                if (ok) {
                                                  // Navigator.pushReplacement(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: ((context) =>
                                                  //         HomePage()),
                                                  //   ),
                                                  //);
                                                } else {
                                                  passwordController.clear();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                  Navigator.pop(context, false);
                                                }
                                              }
                                            },
                                            child: Text('Entrar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: Text('Entrar'),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          footer: Footer(
            alignment: Alignment.center,
            backgroundColor: Colors.white,
            // padding: EdgeInsets.all(2),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => launch(
                          'https://www.instagram.com/agapesistemas/',
                          universalLinksOnly: true,
                        ),
                        child: Container(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/640px-Instagram_icon.png',
                            fit: BoxFit.fill,
                            width: 32,
                            height: 32,
                          ),
                          width: 32,
                          height: 32,
                        ),
                      ),
                      InkWell(
                        onTap: () => launch(
                          'https://www.linkedin.com/company/agapesistemas/mycompany/',
                          universalLinksOnly: true,
                        ),
                        child: Container(
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/174/174857.png',
                            fit: BoxFit.fill,
                            width: 32,
                            height: 32,
                          ),
                          width: 32,
                          height: 32,
                        ),
                      ),
                      InkWell(
                        onTap: () => launch(
                          'https://www.agapesistemas.com.br/',
                          universalLinksOnly: true,
                        ),
                        child: Container(
                          child: Image.network(
                            'https://www.agapesistemas.com.br/novo/favicon.png',
                            fit: BoxFit.fill,
                            width: 32,
                            height: 32,
                          ),
                          width: 32,
                          height: 32,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.copyright_sharp,
                          color: Colors.grey[600],
                        ),
                        Flexible(
                          child: Text(
                            'Todos os direitos reservados a Ágape Sistemas e Tecnologias',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obj = cpfController.text;
    obj =
        obj.replaceAll('-', '').replaceAll('.', '') + _selectedAlias.toString();

    var body = jsonEncode({
      "usu_login": obj,
      "usu_pwd": md5
          .convert(utf8.encode(passwordController.text))
          .toString()
          .toUpperCase()
    });
    var url =
        Uri.parse('https://agportal.agapesistemas.com.br/AgPortalApi/login');
    var resposta = await http.post(
      url,
      headers: {'Accept': 'text/plain', 'content-type': 'application/json'},
      body: body,
    );
    if (resposta.statusCode == 200) {
      await sharedPreferences.setString('token', resposta.body);
      return true;
    } else {
      return false;
    }
  }
}
