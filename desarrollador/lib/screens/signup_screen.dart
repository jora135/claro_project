import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:desarrollador/screens/signin_screen.dart';
import 'package:desarrollador/utils/w_reu.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Crear Una Cuenta",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        ], 
        begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              campoTextoReusable("Ingrese Nombre", Icons.person_outline, false,
                  _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              campoTextoReusable("Ingrese Dirección de Correo", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              campoTextoReusable("Ingrese Contraseña", Icons.lock_outlined, true,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              signInButton(context, 'Registrarse', () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                    .then((value) {
                  print("Crear Cuenta Nueva");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingnInScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              })

            ],
          ),
        ))),
    );
  }
}