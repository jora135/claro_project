import 'package:desarrollador/WR.dart';
import 'package:desarrollador/modelos/R.dart';
import 'package:desarrollador/modelos/REvaluacion.dart';
import 'package:desarrollador/modelos/RDesarrollo.dart';
import 'package:desarrollador/modelos/Rechazadas.dart';
import 'package:flutter/material.dart';

import 'BT.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.titulo}) : super(key: key);

  final String titulo;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4, //2
      child: Scaffold(
        
        appBar: AppBar(
          title: BarraTitulo(titulo: widget.titulo),// icono y texto de encabezado, traido desde Widgets.dart
          bottom: const TabBar(
            tabs: <Widget>[
              //Tab(text: 'Proyectos registrados', icon: Icon(Icons.article)),
              Tab(text: 'Presentado Y En Aprovación', icon: Icon(Icons.task_sharp)),
              Tab(text: 'Plan De Trabajo Y Presupuesto', icon: Icon(Icons.work)),
              Tab(text: 'Desarrollo', icon: Icon(Icons.settings)),
              Tab(text: 'Finiquitado', icon: Icon(Icons.find_in_page)),
              //Tab(text: 'Articulos y estado de atencion', icon: Icon(Icons.article)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Esquema_R(titulo: 'Esquema R de cRud'),
            ),

            Center(
              child: Esquema_R1(titulo: 'Esquema R de cRud'),
            ),

            Center(
              child: Esquema_R2(titulo: 'Esquema R de cRud'),
            ),

            Center(
              
              child: Esquema_R3(titulo: 'Esquema R de cRud'),
            ),

          ],
        ),
      ),
    );
  }
}