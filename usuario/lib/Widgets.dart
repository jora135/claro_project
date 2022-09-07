import 'package:cloud_firestore/cloud_firestore.dart';
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
            image: AssetImage('assets/unnamed.png'), width: 80, height: 80),
        const SizedBox(
          width: 10.5,
        ), //espaciado entre icono y texto
        Text(titulo),
      ],
    ); // icono de encabeazado
  }
}

//======================== del R.dart=============================================

class registro_visual extends StatefulWidget {
  registro_visual(
      {Key? key,
      //required this.NombreProyecto,
      required this.Nombrequiensolicita,
      required this.Descripcionproyecto,
      required this.Beneficios,
      required this.Areaimpacto,
      required this.plantrabajo,
      required this.presupuesto,
      required this.coments})
      : super(key: key);
  //final String NombreProyecto;
  final String Nombrequiensolicita;
  final String Descripcionproyecto;
  final String Beneficios;
  final String Areaimpacto;
  final String plantrabajo;
  final String presupuesto;
  final String coments;

  //establecer la referencia a la base de datos
  CollectionReference dato = FirebaseFirestore.instance.collection('Proyecto');

  //metodo para insertar un registro

  @override
  State<registro_visual> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visual> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch, //alinea todo a la izquierda
      children: [
        Text('\nNombre del solicitante:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.Nombrequiensolicita}'),
        Text('\nDescripción del proyecto:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.Descripcionproyecto}'),
        Text('\nBeneficios:', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.Beneficios}'),
        Text('\nÁrea de mayor impacto:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.Areaimpacto}'),
        Text('\nPlan de trabajo:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.plantrabajo}'),
        Text('\nPresupuesto:', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.presupuesto}'),
        Text('\nComentarios:', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${widget.coments}'),
      ],
    );
  }
}
