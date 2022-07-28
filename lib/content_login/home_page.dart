import 'package:agportalservidorapk/content_login/main_select_alias_page.dart';
import 'package:agportalservidorapk/content_login/login_page.dart';
import 'package:agportalservidorapk/content_login/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          MainPage(),
          MainAliasPage(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: paginaAtual,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.list), label: "Todas"),
      //     BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritas")
      //   ],
      // ),
    );
  }
}
