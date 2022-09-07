import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:desarrollador/utils/w_reu.dart';


class ReseteoPass extends StatefulWidget {
  const ReseteoPass({Key? key}) : super(key: key);

  @override
  _ReseteoPassState createState() => _ReseteoPassState();
}

class _ReseteoPassState extends State<ReseteoPass> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Restablecer Contraseña",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
          hexStringToColor("F44336"),
          hexStringToColor("FC4646"),
          hexStringToColor("FC4646"),
          hexStringToColor("F44336")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                campoTextoReusable("Ingrese Dirección de Correo", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                signInButton(context, "Restablecer Contraseña", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ))),
    );
  }
}