import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MatriculaItem {
  final String categoria;
  final String dado;

  MatriculaItem({required this.categoria, required this.dado});
}

class Mtitems {
  static var matricula = MatriculaItem(categoria: 'Matricula', dado: 'exemplo');
  static var cpf = MatriculaItem(categoria: 'CPF', dado: '000.000.000-00');
  static var datasol =
      MatriculaItem(categoria: 'Data de Solicitação', dado: '00/00/0000');
  static var datalei =
      MatriculaItem(categoria: 'Data de Leitura', dado: '00/00/0000');
  static var situacao = MatriculaItem(categoria: 'Situação', dado: 'exemplo');

  static final List<MatriculaItem> all = [
    matricula,
    cpf,
    datasol,
    datalei,
    situacao,
  ];
}

Widget DrawMatricula(BuildContext context) { 
  final _size = MediaQuery.of(context).size;
  return SizedBox(height: _size.height * 0.15,
  child:   Column(
        children: Mtitems.all
            .map((item) =>  SizedBox(
              height: _size.height * 0.09,
              child: Column(
                      children: [
                        SizedBox(
                          height:_size.height * 0.08,
  
                            child: Padding(
                              padding:  EdgeInsets.only(left: _size.width * 0.045),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: _size.width * 0.25,
                                    child: Text(item.categoria,style: GoogleFonts.inter(color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600),),
                                  ),
                                VerticalDivider(
                                      thickness: 1,
                                      color: Colors.black,
                                      width: _size.width * 0.02,
                                      endIndent: 8,
                                      indent: 8,
                                    ),
                                 
                                  Padding(
                                    padding: EdgeInsets.only(left: _size.width * 0.023),
                                    child: SizedBox(
                                    
                                      width: _size.width * 0.50,
                                      child: Text(item.dado,style: GoogleFonts.inter(color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w600),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                       
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                          height: _size.height * 0.01,
                          endIndent: 8,indent: 8,
                        )
                      ],
                    ),
            ),
                )
            .toList(),
      ),
); }
