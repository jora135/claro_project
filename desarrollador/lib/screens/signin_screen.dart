import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:desarrollador/Estructura.dart';
import 'package:desarrollador/screens/reset_password.dart';
import 'package:desarrollador/screens/signup_screen.dart';
import 'package:desarrollador/utils/w_reu.dart';

class SingnInScreen extends StatefulWidget {
  const SingnInScreen({Key? key}) : super(key: key);

  @override
  State<SingnInScreen> createState() => _SingnInScreenState();
}

class _SingnInScreenState extends State<SingnInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("F44336"),
            hexStringToColor("FC4646"),
            hexStringToColor("FC4646"),
            hexStringToColor("F44336")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/unnamed.png"),
                const SizedBox(
                  height: 30,
                ),
                campoTextoReusable("Ingrese Usuario", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                campoTextoReusable("Ingrese Contraseña", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                OlvidoPassword(context),
                signInButton(context, 'Iniciar Sesión', () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  titulo: '',
                                )));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOpcion()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOpcion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tiene una cuenta?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Registrate",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget OlvidoPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "¿Olvidaste la contraseña?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReseteoPass())),
      ),
    );
  }
}
