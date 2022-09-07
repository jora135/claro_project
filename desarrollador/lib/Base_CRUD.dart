//import 'package:desarrollador/Estructura.dart';
import 'package:desarrollador/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//elimina etiqaueta debug
      title: 'Claro project',
      
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SingnInScreen(),
    );
  }
}