import 'dart:convert';
import 'dart:ui';

import 'package:agportalservidorapk/pageviewnavigation.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({Key? key}) : super(key: key);
  static String? atualAlias;
  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  final _formKey = GlobalKey<FormState>;
  TextEditingController cpfcontroller = TextEditingController();
  TextEditingController senhacontroller = TextEditingController();
  bool isitvisible = true;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/bg5.jpg'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.7, sigmaY: 6.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.14),
                  child: Container(
                    height: _size.height * 0.17,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pbs.twimg.com/profile_images/978781386852233216/UExa9LM5_400x400.jpg')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.041),
                  child: Text(
                    'Indentificação',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.041),
                  child: Container(
                    height: _size.height * 0.076,
                    width: _size.width * 0.81,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-1, -1),
                              color: Color.fromARGB(190, 12, 78, 176))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0E5CD0)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'CPF Obrigatório';
                          } else if (value.length < 14) {
                            return 'Digite um CPF Valido';
                          }
                          return null;
                        }),
                        keyboardType: TextInputType.number,
                        controller: cpfcontroller,
                        maxLength: 14,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ],
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            suffixIcon: cpfcontroller.text.isEmpty
                                ? const Text('')
                                : GestureDetector(
                                    onTap: (() => setState(() {
                                          cpfcontroller.clear();
                                        })),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                            hintText: '000.000.000-00',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 161, 161, 161)),
                            labelText: 'CPF',
                            labelStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            contentPadding: EdgeInsets.all(_size.width * 0.012),
                            alignLabelWithHint: false,
                            counterText: '',
                            counterStyle:
                                TextStyle(height: double.minPositive)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.018),
                  child: Container(
                    height: _size.height * 0.076,
                    width: _size.width * 0.81,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0E5CD0)),
                    child: Align(
                      child: TextFormField(
                        controller: senhacontroller,
                        obscureText: isitvisible,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Senha Obrigatoria';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 161, 161, 161)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isitvisible = !isitvisible;
                              });
                            },
                            child: Icon(
                              isitvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Digite sua Senha',
                          labelText: 'Senha',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusColor: Colors.white,
                          contentPadding: EdgeInsets.all(_size.width * 0.012),
                          alignLabelWithHint: false,
                          counterText: '',
                          counterStyle: TextStyle(height: double.minPositive),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.008,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _size.width * 0.10),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueceu a Senha?',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _size.width * 0.18),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.085),
                  child: Container(
                    height: _size.height * 0.13,
                    width: _size.width * 0.81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment(0.1, 0.1),
                        colors: <Color>[
                          Color.fromARGB(255, 6, 55, 128),
                          Color.fromARGB(255, 69, 143, 255),
                        ],
                      ),
                    ),
                    child: Center(
                      child: TextButton(

                          onPressed: () async {
                            if (LoginPageNew.atualAlias != null &&
                                LoginPageNew.atualAlias != '') {
                                  bool Ok = await dologin();
                                  if (Ok == true) {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => customnavigation(),));
                                  }else{
                                    final snack = SnackBar(content: Text('CPF ou Senha Invalidos'),duration: Duration(milliseconds: 3000),);
                                    ScaffoldMessenger.of(context).showSnackBar(snack);
                                  }
                                }else{
                                  final snack = SnackBar(content: Text('Erro no Cliente, Favor voltar'),duration: Duration(milliseconds: 3000),);
                                  ScaffoldMessenger.of(context).showSnackBar(snack);
                                }

                              
                          },
                          child:  const Text(
                    'Entrar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> dologin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obj = cpfcontroller.text;
    obj = obj.replaceAll('-', '').replaceAll('.', '') +
        LoginPageNew.atualAlias.toString();

    var body = jsonEncode({
      "usu_login": obj,
      "usu_pwd": md5
          .convert(utf8.encode(senhacontroller.text))
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
