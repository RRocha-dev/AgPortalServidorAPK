import 'package:agportalservidorapk/pageviewnavigation.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class finButton extends StatefulWidget {
  //botao financeiro
  finButton({Key? key}) : super(key: key);

  @override
  State<finButton> createState() => _finButtonState();
}

double padfinanceiro = 0;
bool animatfincheck = false;
late AnimationController financontrol;

late DecorationTween finanshadow;

class _finButtonState extends State<finButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finanshadow = DecorationTween(
        begin: BoxDecoration(
            color: Color(0xff0E5CD0),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-6, 6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208)),
              BoxShadow(
                  offset: Offset(6, -6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208))
            ]),
        end: BoxDecoration(
            color: Color(0xff3385FF),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255)),
              BoxShadow(
                  offset: Offset(-7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255))
            ]));
    financontrol =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));

    financontrol.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animatfincheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animatfincheck = false;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    void animatefinan() {
      if (padfinanceiro == 0) {
        padhelp = 0;
        padfinanceiro =  0.08;
        padsolicitacao = 0;
      } else {
        padfinanceiro = 0;
      }
      pageviewcontroller.animateToPage(0,
          duration: Duration(milliseconds: 150), curve: Curves.easeInOut);

      if (animatfincheck == false) {
        financontrol.forward();
      }

      solicicontrol.reverse();
      helpcontrol.reverse();
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: _size.height * padfinanceiro),
      duration: Duration(milliseconds: 60),
      child: DecoratedBoxTransition(
          decoration: finanshadow.animate(financontrol),
          child: Container(
            height: _size.height * 0.07,
            width: _size.width * 0.14,
            child: InkWell(
              child: Image.asset(
                'assets/financeiro.png',
                scale: _size.height * 0.02,
                color: Colors.white,
              ),
              onTap: () {
                animatefinan();
              },
            ),
          )),
    );
  }
}

//-------------------------------------------------------------------------------

class soliButton extends StatefulWidget {
  //botao solicitacao
  soliButton({Key? key}) : super(key: key);

  @override
  State<soliButton> createState() => _soliButtonState();
}


double padsolicitacao = 0.08;
bool animatsolicheck = true;
late AnimationController solicicontrol;

late DecorationTween solicishadow;

class _soliButtonState extends State<soliButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    solicicontrol =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));
    solicishadow = DecorationTween(
        begin: BoxDecoration(
            color: Color(0xff0E5CD0),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-6, 6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208)),
              BoxShadow(
                  offset: Offset(6, -6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208))
            ]),
        end: BoxDecoration(
            color: Color(0xff3385FF),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255)),
              BoxShadow(
                  offset: Offset(-7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255))
            ]));

    solicicontrol.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animatsolicheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animatsolicheck = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    void animatesoli() {
      if (padsolicitacao == 0) {
        padfinanceiro = 0;
        padsolicitacao = 0.08;
        padhelp = 0;
      } else {
        padsolicitacao = 0;
      }
      pageviewcontroller.animateToPage(1,
          duration: Duration(milliseconds: 150), curve: Curves.easeInOut);

      if (animatsolicheck == false) {
        solicicontrol.forward();
      }
      financontrol.reverse();
      helpcontrol.reverse();
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: _size.height * padsolicitacao),
      duration: Duration(milliseconds: 60),
      child: DecoratedBoxTransition(
          decoration: solicishadow.animate(solicicontrol),
          child: Container(
            height: _size.height *0.07,
            width: _size.width *0.14,
            child: InkWell(
              child: Padding(
                  padding: EdgeInsets.only(left: _size.width *0.017),
                  child: Image.asset(
                    'assets/solicitacao.png',
                    scale: _size.height * 0.025,
                    color: Colors.grey[50],
                  )),
              onTap: () {
                animatesoli();
              },
            ),
          )),
    );
  }
}

//-------------------------------------------------------------------------------

class helpbutto extends StatefulWidget {
  helpbutto({Key? key}) : super(key: key);

  @override
  State<helpbutto> createState() => _helpbuttoState();
}

double padhelp = 0;
bool animathelpcheck = false;
late AnimationController helpcontrol;

late DecorationTween helpshadow;

class _helpbuttoState extends State<helpbutto>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helpshadow = DecorationTween(
        begin: BoxDecoration(
            color: Color(0xff0E5CD0),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-6, 6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208)),
              BoxShadow(
                  offset: Offset(6, -6),
                  blurRadius: 14,
                  color: Color.fromARGB(158, 14, 92, 208))
            ]),
        end: BoxDecoration(
            color: Color(0xff3385FF),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255)),
              BoxShadow(
                  offset: Offset(-7, 32),
                  blurRadius: 12,
                  color: Color.fromARGB(175, 116, 172, 255))
            ]));
    helpcontrol =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));

    helpcontrol.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animathelpcheck = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          animathelpcheck = false;
        });
      }
    });
    solicicontrol.forward();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    void animatehelp() {
      if (padhelp == 0) {
        padfinanceiro = 0;
        padhelp = 0.08;
        padsolicitacao = 0;
      } else {
        padhelp = 0;
      }
      pageviewcontroller.animateToPage(2,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (animathelpcheck == false) {
        helpcontrol.forward();
      }
      financontrol.reverse();
      solicicontrol.reverse();
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: _size.height * padhelp),
      duration: Duration(milliseconds: 60),
      child: DecoratedBoxTransition(
          decoration: helpshadow.animate(helpcontrol),
          child: Container(
            height: _size.height * 0.07,
            width: _size.width * 0.14,
            child: InkWell(
              child: Icon(
                Icons.help_outline,
                size: _size.height * 0.05,
                color: Colors.grey[50],
              ),
              onTap: () {
                animatehelp();
              },
            ),
          )),
    );
  }
}

//-------------------------------------------------------------------------------------

class menubutton extends StatelessWidget {
  menubutton({required this.iconM, required this.textM});
  IconData iconM;
  String textM;

  @override
  Widget build(BuildContext context) {
   final _size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.all(_size.width * 0.013),
      child: Container(
        height: _size.height * 0.06,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               SizedBox(
                width: _size.height * 0.0142,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  iconM,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: _size.height * 0.01,
              ),
              SizedBox(width: _size.width * 0.37,
              height: _size.height * 0.1,
                child: Center(
                  child: Text(
                    textM,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
           ),
      ),
    );
  }
}
