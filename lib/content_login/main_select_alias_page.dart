import 'package:flutter/material.dart';

class MainAliasPage extends StatefulWidget {
  const MainAliasPage({Key? key}) : super(key: key);

  @override
  State<MainAliasPage> createState() => _MainAliasPageState();
}

class _MainAliasPageState extends State<MainAliasPage> {
  var _primaryColor = Color.fromRGBO(71, 66, 131, 0.2);
  var _errorColor = Colors.red;
  String? _selectedAlias = '';
  List<DropdownMenuItem<String>> get _listAlias {
    List<DropdownMenuItem<String>> menuItens = [
      DropdownMenuItem(
        child: Text('-Selecione-'),
        value: '',
      ),
      DropdownMenuItem(
        child: Text('Agape'),
        value: '.agape',
      ),
    ];
    return menuItens;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            scale: 1, fit: BoxFit.cover, image: AssetImage("assets/bg4.jpg")),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selecione o ",
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                  Text(
                    "Municipio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Theme(
                data: Theme.of(context).copyWith(canvasColor: _primaryColor),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _primaryColor),
                    child: DropdownButtonFormField(
                      style: TextStyle(color: Colors.white),
                      alignment: Alignment.center,
                      // hint: Text("-Selecione-"),
                      dropdownColor: _primaryColor,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        counterStyle: TextStyle(color: Colors.white),
                        focusColor: _primaryColor,
                        fillColor: _primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: _primaryColor, width: 1)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: _errorColor, width: 1),
                        ),
                      ),
                      value: _selectedAlias,
                      items: _listAlias,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedAlias = value;
                        });
                      },
                      validator: (cliente) {
                        if (cliente == null || cliente == "") {
                          return "Favor, selecione um cliente";
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                child: Container(
                  height: _size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(0.1, 0.1),
                      colors: <Color>[
                        Color.fromRGBO(205, 106, 251, 1),
                        Color.fromRGBO(98, 78, 235, 1)
                      ],
                    ),
                  ),
                  child:
                      TextButton(child: Text("Prosseguir"), onPressed: () {}),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
