import 'package:agportalservidorapk/content_login/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            scale: 1,
            fit: BoxFit.cover,
            // image: NetworkImage(
            //     "https://sitesagapesistemas.com.br/2022/app/img/bg5.jpg"),
            image: AssetImage("assets/bg5.jpg")),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("assets/logo-servidor.png"),
                  height: _size.height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                  child: Text(
                    "Contra-Cheque",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                  child: Text(
                    "Emissão de contra-cheque do servidor",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                  child: Text(
                    "Realizar Requerimentos",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                  child: Text(
                    "Servidor possa requerer ao RH qualquer coisa de seu interesse",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Atualizar dados cadastrais",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Acesso ao seu cadastro e realizar alterações",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.09),
                  child: Container(
                    width: _size.width * 0.78,
                    height: _size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment(0.1, 0.1),
                        colors: <Color>[
                          Color.fromARGB(255, 6, 55, 128),
                          Color.fromARGB(255, 69, 143, 255),
                        ],
                      ),
                    ),
                  
                      child: InkWell(
                          onTap: () {
                            pc.animateToPage(1,
                                duration: Duration(milliseconds: 450),
                                curve: Curves.easeIn);
                          },
                          child: const Center(
                            child: Text('Prosseguir',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)),
                          )),
                    ),
                  ),
                
              ],
            ),
          ),
          Container(
            child: Image.asset("assets/logo-agape.png"),
          )
        ],
      ),
    );
  }
}
