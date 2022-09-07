//read 2:55:50 hh-mm-ss //// visualizacion de datos en la misma app  (datos)

// ignore_for_file: deprecated_member_use

import 'package:desarrollador/WR.dart';
import 'package:flutter/material.dart';

//================================================
//    Configuracion de firestore
import 'package:cloud_firestore/cloud_firestore.dart';
//================================================

class Esquema_R extends StatefulWidget {
  const Esquema_R({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  State<Esquema_R> createState() => _Esquema_R_State();
}

class _Esquema_R_State extends State<Esquema_R> {
  //======================= conector de respuesta a la base de datos =================
  //stream es ponerlo en serealizable //querySnapshot para ver los cambios sin refrescar
  // ignore: prefer_final_fields
  Stream<QuerySnapshot> _consultaStream = FirebaseFirestore.instance
      .collection('Proyecto')
      .where('estadop', isEqualTo: 'Presentado')
      .snapshots(); 

//=============================================================

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _consultaStream,
        builder: (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot) {
          // primero puede salier quqe haya un error
          if (snapshot.hasError) {
            print('============ ERROR =============');
            return const Text('Upsss, algo salio mal');
          }
          // puede pasar que  esta cargando
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('============ LOADING =============');
            return const Text('CARGANDO LOS DATOS...');
          }
          // puede pasar que no haya error
          print('============ CARGO CORRECTAMENTE =============');
          return ListView(
            // childrent se asocia a la salida de snapshot 'la data, la cual puede ser opcional data!'
            // y carga los documentos en una hass table
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              //! --> opcional
              Map<String, dynamic> data = document.data()!
                  as Map<String, dynamic>; // as que lo asume como...
              return 
                Center(
                  child: Card(
                    child: Column(
                      children: [
                        FlatButton(
                          color: Colors.grey,
                          onPressed: () {},
                          child: Text(
                            '${data['estadoem']}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          title:
                              Text('Nombre Proyecto: ${data['NombreProyecto']}'),
                          subtitle: registro_visual(
                            NombreProyecto: data['NombreProyecto'],
                            Nombrequiensolicita: data['Nombrequiensolicita'],
                            Descripcionproyecto: data['Descripcionproyecto'],
                            Beneficios: data['Beneficio'],
                            Areaimpacto: data['Areaimpacto'],
                            estadoem: data['estadoem'],
                            estadop: data['estadop'],
                            plantrabajo: data['plantrabajo'],
                            presupuesto: data['presupuesto'],
                            coments: data['coments'],
                          ),
                          //-------------------------------------------------------------------
                        ),
                      ],
                    ),
                  ),
                );
            }).toList(),
          );
        });
  }
}
