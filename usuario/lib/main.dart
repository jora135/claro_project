import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:usuario/Base_CRUD.dart';

import 'firebase_options.dart';

void main() async {
  //==================================================================
  //====  lo que se construya en el objeto runApp va a estar validado por la cuenta  ======

  //inicializar servidor
  WidgetsFlutterBinding.ensureInitialized();
  //antes de inicializar, crear espera
  await Firebase.initializeApp(
    // configuracion por defecto, cargar la configuracion en el archivo actual
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //===================================================================

  runApp(const MyApp());
}
