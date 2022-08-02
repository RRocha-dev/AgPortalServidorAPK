import 'dart:math';
import 'dart:ui';

import 'package:agportalservidorapk/buttonmodels/buttonmodels.dart';
import 'package:agportalservidorapk/pagemodels.dart/ajuda_page.dart';
import 'package:agportalservidorapk/pagemodels.dart/financeiro_page.dart';
import 'package:agportalservidorapk/pagemodels.dart/solicitacao_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late PageController pageviewcontroller;


class customnavigation extends StatefulWidget {
  customnavigation({Key? key}) : super(key: key);

  static late Function Pressed;

  @override
  State<customnavigation> createState() => _customnavigationState();
}

class _customnavigationState extends State<customnavigation> {
  @override
  void initState() {
    customnavigation.Pressed =() {
       setState(() {
                                  pageviewnavigator.showdrawer = 1;
                                });
    }; 

    
    pageviewcontroller = PageController(initialPage: 1);
    // TODO: implement initState
    super.initState();
  }

  
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: null,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: ExactAssetImage('assets/agapefundo.jpeg'),
              )),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: _size.width * 0.54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(_size.width * 0.06, _size.height * 0.07, 0, _size.height * 0.15),
                          child: Image.asset(
                            'assets/logo.png',
                            width: _size.width * 0.40,
                          ),
                        ),
                        menubutton(
                            iconM: Icons.person_search, textM: 'Alterar Matricula'),
                        menubutton(iconM: Icons.upcoming, textM: 'Solicitação'),
                        menubutton(iconM: Icons.wallet, textM: 'Financeiro'),
                        menubutton(
                          iconM: Icons.help_rounded,
                          textM: 'Ajuda',
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: _size.height * 0.22),
                          child: SizedBox(
                              child: InkWell(
                                onTap: () => setState(() {
                                  pageviewnavigator.showdrawer = 0;
                                }),
                            child: Row(
                              children: [
                                SizedBox(width: _size.width * 0.025,),
                               const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 206, 86, 84),
                                ),
                                SizedBox(width: _size.width * 0.04,),
                                Text(
                                  'Fechar Menu',
                                  style: GoogleFonts.inter(
                                      fontSize: 19,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            pageviewnavigator()
          ],
        ));
  }
}

class menudraw extends StatelessWidget {
  const menudraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.10,
      height: _size.height * 0.06,
      decoration:  const BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(-2, 2.5),
                color: Color.fromARGB(127, 72, 141, 245))
          ],
          color: Color(0xff488DF5),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(0),right: Radius.circular(17)),),
      child: IconButton(
        onPressed: () {
          pageviewnavigator.pressed;
          
        },
        icon: Icon(Icons.drag_indicator),
        color: Colors.white,
      ),
    );
  }
}

class pageviewnavigator extends StatefulWidget {
  static int showdrawer = 0;
  static late var pressed = () {};

  pageviewnavigator({Key? key}) : super(key: key);

  @override
  State<pageviewnavigator> createState() => _pageviewnavigatorState();
}

class _pageviewnavigatorState extends State<pageviewnavigator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageviewnavigator.pressed =() {
      pageviewnavigator.showdrawer = 1;
      setState(() {
      });
    };
  }
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return TweenAnimationBuilder(
        tween: Tween<double>(
            begin: 0, end: pageviewnavigator.showdrawer == 1 ? 1 : 0),
        duration: const Duration(milliseconds: 200),
        builder: ((_, double value, __) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..setEntry(0, 3, 200 * value)
              ..rotateY((pi / 6) * value),
            child: ClipRRect(
                borderRadius: pageviewnavigator.showdrawer == 1
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      //fundo
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                    ),
                    Align(
                        //pageview
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: _size.height * 0.90,
                          width: double.infinity,
                          child: PageView(
                            controller: pageviewcontroller,
                            onPageChanged: (index) {},
                            children: [
                              FinanceiroPage(),
                              solicitacao_pagina(),
                              AjudaPage()
                            ],
                          ),
                        )),
                    Align(
                      //CustomPaintBottomNavigator
                      alignment: Alignment.bottomCenter,
                      child: CustomPaint(
                        size: Size(double.infinity,
                            _size.height * 0.15), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: mamasmamas(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _size.height * 0.85),
                      child: Row(
                        //row buttons para page.controller
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: _size.width * 0.10), //botão financeiro
                              child: finButton()),
                          Padding(
                            padding: EdgeInsets.only(
                                left: _size.width * 0.192), //botão solicitacao
                            child: soliButton(),
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: _size.width * 0.20), //botão ajuda
                              child: helpbutto()),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onHorizontalDragUpdate: (v) {
                        if (v.delta.dx > 0) {
                          setState(() {
                            pageviewnavigator.showdrawer = 1;
                          });
                        } else {
                          setState(() {
                            pageviewnavigator.showdrawer = 0;
                          });
                        }
                      },
                    )
                  ],
                )),
          );
        }));
  }
}

class mamasmamas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff0E5CD0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * -0.0003623, size.height * 1.0001000);
    path0.lineTo(0, size.height * 0.3403000);
    path0.lineTo(size.width * 0.0672705, size.height * 0.3452000);
    path0.quadraticBezierTo(size.width * 0.0681401, size.height * 0.7300000,
        size.width * 0.0830676, size.height * 0.7811000);
    path0.cubicTo(
        size.width * 0.0965217,
        size.height * 0.8526000,
        size.width * 0.2436473,
        size.height * 0.8472000,
        size.width * 0.2559179,
        size.height * 0.7850000);
    path0.quadraticBezierTo(size.width * 0.2722947, size.height * 0.7336000,
        size.width * 0.2758937, size.height * 0.3591000);
    path0.lineTo(size.width * 0.3919565, size.height * 0.3584000);
    path0.quadraticBezierTo(size.width * 0.3965459, size.height * 0.7429000,
        size.width * 0.4150483, size.height * 0.7871000);
    path0.cubicTo(
        size.width * 0.4321256,
        size.height * 0.8456000,
        size.width * 0.5781401,
        size.height * 0.8532000,
        size.width * 0.5948551,
        size.height * 0.7811000);
    path0.quadraticBezierTo(size.width * 0.6097585, size.height * 0.7240000,
        size.width * 0.6140580, size.height * 0.3623000);
    path0.lineTo(size.width * 0.7347826, size.height * 0.3630000);
    path0.quadraticBezierTo(size.width * 0.7364734, size.height * 0.7116000,
        size.width * 0.7499034, size.height * 0.7682000);
    path0.cubicTo(
        size.width * 0.7649034,
        size.height * 0.8445000,
        size.width * 0.8978502,
        size.height * 0.8565000,
        size.width * 0.9307246,
        size.height * 0.7725000);
    path0.quadraticBezierTo(size.width * 0.9479710, size.height * 0.7312000,
        size.width * 0.9479469, size.height * 0.3587000);
    path0.lineTo(size.width * 0.9995169, size.height * 0.3580000);
    path0.lineTo(size.width * 0.9995169, size.height * 1.0001000);
    path0.lineTo(size.width * -0.0003623, size.height * 1.0001000);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



