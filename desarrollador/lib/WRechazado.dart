// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//===================================================================
// 2:30 hh/min   2022-06-15

class registro_visual extends StatefulWidget {
  registro_visual({
    Key? key,
    required this.NombreProyecto,
    required this.Nombrequiensolicita,
    required this.Descripcionproyecto,
    required this.Beneficios,
    required this.Areaimpacto,
    required this.estadoem,
    required this.estadop,
    required this.plantrabajo,
    required this.presupuesto,
    required this.coments,
  }) : super(key: key);
  final String NombreProyecto;
  final String Nombrequiensolicita;
  final String Descripcionproyecto;
  final String Beneficios;
  final String Areaimpacto;
  String estadoem;
  String estadop;
  final String plantrabajo;
  final String presupuesto;
  final String coments;
  final txtComentarios = TextEditingController();
  final txtComentarios1 = TextEditingController();
  final txtComentarios2 = TextEditingController();

  //establecer la referencia a la base de datos
  CollectionReference dato = FirebaseFirestore.instance.collection('Proyecto');

  //metodo para insertar un registro
  Future<void> updateRegistro(documento, estadoem, estadop) {
    return dato
        .doc(documento)
        .update({
          'estadoem': estadoem,
          'estadop': estadop,
          'coments': txtComentarios.text,
          'plantrabajo': txtComentarios1.text,
          'presupuesto': txtComentarios2.text
        })
        .then((value) => print("Registro se actualizo con exito"))
        .catchError((error) => print("Algo salio mal: $error"));

    //return dato.add({'Campo1': txtCampo1.text, 'Campo2': txtCampo2.text});
  }

  @override
  State<registro_visual> createState() => _registro_visual();
}

class _registro_visual extends State<registro_visual> {
  @override
  Widget build(BuildContext context) {
    widget.txtComentarios.text = widget.coments;
    widget.txtComentarios1.text = widget.plantrabajo;
    widget.txtComentarios2.text = widget.presupuesto;

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
        
        
        //campos del formulario

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: TextFormField(
            controller: widget.txtComentarios,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Ingrese comentarios',
            ),
          ),
        ),
        //-----------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Alerta'),
                  content: const Text(
                      '¿Esta seguro/a de que desea actualizar los comentarios?'),
                  actions: [
                    FlatButton(
                      child: const Text('Aceptar'),
                      onPressed: () {
                        setState(() {
                          widget.updateRegistro(widget.NombreProyecto,
                              widget.estadoem, widget.estadop);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'Actualizar Comentarios',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
    
  }
}
