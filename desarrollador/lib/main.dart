import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:desarrollador/Base_CRUD.dart';

import 'firebase_options.dart';

void main() async {
  //==================================================================
  //====  lo que se construya en el objeto runApp va a estar validado por la cuenta  ======

  //inicializar servidor
  WidgetsFlutterBinding.ensureInitialized();
  //antes de inicializar, crear espera
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // configuracion por defecto, cargar la configuracion en el archivo actual
  );
  //===================================================================

  runApp(const MyApp());
}
