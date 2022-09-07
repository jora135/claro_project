//import 'package:usuario/Estructura.dart';
import 'package:flutter/material.dart';
import 'package:usuario/screens/signin_screen.dart';

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

