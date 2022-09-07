import 'package:flutter/material.dart';
import 'package:usuario/Widgets.dart';
import 'package:usuario/modulos/C.dart';
import 'package:usuario/modulos/R.dart';
//import 'package:ingreso_de_datos/modulos/R.dart';

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
      length: 2, //2
      child: Scaffold(
        appBar: AppBar(
          title: BarraTitulo(
              titulo: widget.titulo), // icono y texto de encabezado, traido desde Widgets.dart
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Registro De Proyecto', icon: Icon(Icons.app_registration)),
              Tab(text: 'Proyectos registrados', icon: Icon(Icons.article)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Esquema_C(titulo: 'Esquema C de Crud'),
            ),
            
            Center(
              child: Esquema_R(titulo: 'Esquema R de cRud'),
            ),
          ],
        ),
      ),
    );
  }
}
