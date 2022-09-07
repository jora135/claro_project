import 'package:flutter/material.dart';


//Widget de la barra icono y titulo ======================================

class BarraTitulo extends StatelessWidget {
  const BarraTitulo({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/unnamed.png'),
          width: 80, 
          height: 80
        ),
        const SizedBox(
          width: 10.5,
        ), //espaciado entre icono y texto
        Text(titulo),
      ],
    ); // icono de encabeazado
  }
}



