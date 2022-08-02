
import 'package:agportalservidorapk/pageviewnavigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FinanceiroPage extends StatefulWidget {
  FinanceiroPage({Key? key}) : super(key: key);

  @override
  State<FinanceiroPage> createState() => _FinanceiroPageState();
}

class _FinanceiroPageState extends State<FinanceiroPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Stack(children: [
            
            Padding(
              padding: EdgeInsets.fromLTRB(_size.width * 0.10, _size.height * 0.110, _size.width * 0.08, 0),
              child: SizedBox(
                height: _size.height * 0.75,
                width: _size.width * 0.80,
                child: Column(
                  children: [
                    Container( //contra cheque card------------------------------------------------------------
                      height: _size.height * 0.235,
                      width: _size.width * 0.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-5, 4),
                                color: Color.fromARGB(111, 91, 153, 212),
                                blurRadius: 3),
                            BoxShadow(
                                offset: Offset(1, -1),
                                color: Color.fromARGB(111, 91, 153, 212),
                                blurRadius: 2)
                          ]),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(child: Center(
                                      child: Text(
                                        'Contra Cheque',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000)),
                                      ),),
                                height: _size.height * 0.045,
                                width: _size.width * 0.35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          color:
                                              Color.fromARGB(138, 29, 75, 117),
                                          blurRadius: 2),
                                      BoxShadow(
                                          offset: Offset(1, 0),
                                          color:
                                              Color.fromARGB(138, 29, 75, 117),
                                          blurRadius: 1)
                                    ]),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _size.height * 0.013, horizontal: _size.width * 0.02),
                            child: SizedBox(
                              height: _size.height * 0.055,
                              child: Row(
                                children: [
                                  Text(
                                    'Competência:',
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: _size.width * 0.013,
                                    ),
                                    child: Container(
                                      width: _size.width * 0.34,
                                      child: Center(
                                        child: Text('exemplo',
                                            style: GoogleFonts.inter(
                                                fontSize: 17.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC4E0EE),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(-2, 2),
                                                blurRadius: 1,
                                                color: Color.fromARGB(
                                                    100, 27, 120, 166))
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    width: _size.width * 0.112,
                                    height: _size.height * 0.08,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-2, 2.5),
                                              color: Color.fromARGB(
                                                  127, 72, 141, 245))
                                        ],
                                        color: Color(0xff488DF5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: InkWell(
                                      child: Transform.rotate(
                                        alignment: Alignment.center,
                                        angle: 0,
                                        child: Image.asset(
                                          'assets/arrow.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: _size.width * 0.023),
                            child: SizedBox(
                              height: _size.height * 0.055,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: _size.width * 0.29,
                                    child: Center(
                                      child: Text(
                                        'Tipo:',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: _size.width * 0.013,
                                    ),
                                    child: Container(
                                      width: _size.width * 0.34,
                                      child: Center(
                                        child: Text('exemplo',
                                            style: GoogleFonts.inter(
                                                fontSize: 17.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC4E0EE),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(-2, 2),
                                                blurRadius: 1,
                                                color: Color.fromARGB(
                                                    100, 27, 120, 166))
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    width: _size.width * 0.112,
                                    height: _size.height * 0.08,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-2, 2.5),
                                              color: Color.fromARGB(
                                                  127, 72, 141, 245))
                                        ],
                                        color: Color(0xff488DF5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: InkWell(
                                      child: Transform.rotate(
                                        alignment: Alignment.center,
                                        angle: 0,
                                        child: Image.asset(
                                          'assets/arrow.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _size.height * 0.009),
                            child: Container(
                              width: double.infinity,
                              height: _size.height * 0.045,
                              decoration: BoxDecoration(
                                  color: Color(0xff488DF5),
                                  borderRadius: BorderRadius.circular(11)),
                            ),
                          ),
                        ],
                      ),
                    ), 
                    Padding( //Comprovante de Rendimentos -------------------------------------------------------
                      padding: EdgeInsets.only(top: _size.height * 0.013),
                      child: Container(
                          
                        
                      height: _size.height * 0.234,
                      width: _size.width * 0.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-5, 4),
                                color: Color.fromARGB(111, 91, 153, 212),
                                blurRadius: 3),
                            BoxShadow(
                                offset: Offset(1, -1),
                                color: Color.fromARGB(111, 91, 153, 212),
                                blurRadius: 2)
                          ]),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(child: Center(
                                      child: Text(
                                        'Comprovante de Rendimentos',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000)),
                                      ),),
                                height: _size.height * 0.045,
                                width: _size.width * 0.67,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          color:
                                              Color.fromARGB(138, 29, 75, 117),
                                          blurRadius: 2),
                                      BoxShadow(
                                          offset: Offset(1, 0),
                                          color:
                                              Color.fromARGB(138, 29, 75, 117),
                                          blurRadius: 1)
                                    ]),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _size.height * 0.04, horizontal: _size.width * 0.02),
                            child: SizedBox(
                              height:_size.height * 0.055,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: _size.width * 0.29,
                                    child: Center(
                                      child: Text(
                                        'Ano:',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: _size.width * 0.013,
                                    ),
                                    child: Container(
                                      width: _size.width * 0.34,
                                      child: Center(
                                        child: Text('0000',
                                            style: GoogleFonts.inter(
                                                fontSize: 17.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC4E0EE),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(-2, 2),
                                                blurRadius: 1,
                                                color: Color.fromARGB(
                                                    100, 27, 120, 166))
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    width: _size.width * 0.112,
                                    height: _size.height * 0.08,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-2, 2.5),
                                              color: Color.fromARGB(
                                                  127, 72, 141, 245))
                                        ],
                                        color: Color(0xff488DF5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: InkWell(
                                      child: Transform.rotate(
                                        alignment: Alignment.center,
                                        angle: 0,
                                        child: Image.asset(
                                          'assets/arrow.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(top:_size.height * 0.009),
                            child: Container(
                              width: double.infinity,
                              height: _size.height * 0.045,
                              decoration: BoxDecoration(
                                  color: Color(0xff488DF5),
                                  borderRadius: BorderRadius.circular(11)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                    Padding( //Ficha Financeira -------------------------------------------------------
                      padding: EdgeInsets.only(top: _size.height * 0.013),
                      child: Container(
                      height: _size.height * 0.234,
                      width: _size.width * 0.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-5, 4),
                                color: Color.fromARGB(111, 91, 153, 212),
                                blurRadius: 3),
                            BoxShadow(
                                offset: Offset(1, -1),
                                color: Color.fromARGB(111, 91, 153, 212),
                                blurRadius: 2)
                          ]),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(child: Center(
                                      child: Text(
                                        'Ficha Financeira',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000)),
                                      ),),
                                height: _size.height * 0.045,
                                width: _size.width * 0.40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          color:
                                              Color.fromARGB(138, 29, 75, 117),
                                          blurRadius: 2),
                                      BoxShadow(
                                          offset: Offset(1, 0),
                                          color:
                                              Color.fromARGB(138, 29, 75, 117),
                                          blurRadius: 1)
                                    ]),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _size.height * 0.04, horizontal: _size.width * 0.02),
                            child: SizedBox(
                              height: _size.height * 0.055,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: _size.width * 0.29,
                                    child: Center(
                                      child: Text(
                                        'Ano:',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: _size.width * 0.013,
                                    ),
                                    child: Container(
                                      width: _size.width * 0.34,
                                      child: Center(
                                        child: Text('0000',
                                            style: GoogleFonts.inter(
                                                fontSize: 17.5,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC4E0EE),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(-2, 2),
                                                blurRadius: 1,
                                                color: Color.fromARGB(
                                                    100, 27, 120, 166))
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    width: _size.width * 0.112,
                                    height: _size.height * 0.08,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-2, 2.5),
                                              color: Color.fromARGB(
                                                  127, 72, 141, 245))
                                        ],
                                        color: Color(0xff488DF5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: InkWell(
                                      child: Transform.rotate(
                                        alignment: Alignment.center,
                                        angle: 0,
                                        child: Image.asset(
                                          'assets/arrow.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(top: _size.height * 0.009),
                            child: Container(
                              width: double.infinity,
                              height: _size.height * 0.045,
                              decoration: BoxDecoration(
                                  color: Color(0xff488DF5),
                                  borderRadius: BorderRadius.circular(11)),
                                  child: Center(child: Text('Imprimir',style: TextStyle(fontSize: 23,color: Colors.white),),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(_size.width * 0.0, _size.height * 0.05, 0, 0),
              child: const menudraw(),
            )
          ]),
        ));
  }
}
