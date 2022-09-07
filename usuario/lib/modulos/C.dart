//created   //// subida de datos a la base de datos
import 'package:flutter/material.dart';

//================================================
//    Configuracion de firestore
import 'package:cloud_firestore/cloud_firestore.dart';

//===================================
// ignore: camel_case_types
class Esquema_C extends StatefulWidget {
  const Esquema_C({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  State<Esquema_C> createState() => _Esquema_C_State();
}

// ignore: camel_case_types
class _Esquema_C_State extends State<Esquema_C> {
  //controladores de campo de texto
  final txtCampo1 = TextEditingController();
  final txtCampo2 = TextEditingController();
  final txtCampo3 = TextEditingController();
  final txtCampo4 = TextEditingController();
  final txtCampo5 = TextEditingController();
  String estadoem = '';
  String estadop = '';

//==================================================
  //Establecer la referencia a la base de datos
  //elemento de modelo noSQL las tablas se llaman colecciones
  CollectionReference dato = FirebaseFirestore.instance
      .collection('Proyecto'); //el nombre de la colexion sera FuturosClientes
  //metodo para insertar un registro
  Future<void> addRegistro() {
    //aca se conectan los registros, con java y con spring boot
    //para las 2 formas de adicionar, con documento o sin documento y directamente con id
    //con doc
    return dato
        .doc(txtCampo1.text)
        .set({
          'NombreProyecto': txtCampo1.text,
          'Nombrequiensolicita': txtCampo4.text,
          'Descripcionproyecto': txtCampo2.text,
          'Beneficio': txtCampo3.text,
          'Areaimpacto': txtCampo5.text,
          'estadoem': estadoem,
          'estadop': estadop,
          'presupuesto': "",
          'plantrabajo': "",
          'coments': "",
        })
        //ahora se coloca un catchError
        .then(
            (value) => print("Registro adicionado con exito")) // caso de exito
        .catchError((error) => print("Algo salio mal: $error")); // caso fracaso
    //con add da de nombre numero aleatorio en firebase
    //return dato.add({'campo1':txtCampo1.text, 'campo2':txtCampo2.text});
  }

//==================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // todo centrado
        child: Card(
          // tarjeta de codigo para que se vea bonito y presentable
          child: SingleChildScrollView(
            // barra de desplazamiento //scroll
            //formulario
            child: Column(
              // colomna
              children: [
                //items que contendra
                //Titulo1:
                const ListTile(
                  leading: Icon(Icons.settings_applications,
                      size: 40, color: Colors.red), //icono,tamaño,color
                  title: Text(
                    //titulo
                    'Creacion Del Proyecto',
                    style: TextStyle(fontSize: 25), //tamaño del titulo
                  ),
                  //subtitulo
                  subtitle: Text(
                      'Registro de informacion del proyecto a desarrollar.'),
                ),
                //---------------------------
                //campos del formulario
                Padding(
                  //control de las areas con bordes
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo1, //controlador de campo de texto
                    //informacion de decoracion
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(), // borde
                      labelText:
                          'Ingrese Nombre Del Proyecto', //texto del campo
                    ),
                  ),
                ),
                //---------------------------
                //campos del formulario
                Padding(
                  //control de las areas con bordes
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo4, //controlador de campo de texto
                    //informacion de decoracion
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(), // borde
                      labelText:
                          'Ingrese Nombre De Solicitante', //texto del campo
                    ),
                  ),
                ),
                //---------------------------
                //campos del formulario
                Padding(
                  //control de las areas con bordes
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo2, //controlador de campo de texto
                    //informacion de decoracion
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(), // borde
                      labelText:
                          'Ingrese Descripción Del Proyecto', //texto del campo
                    ),
                  ),
                ),
                //---------------------------
                //campos del formulario
                Padding(
                  //control de las areas con bordes
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo3, //controlador de campo de texto
                    //informacion de decoracion
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(), // borde
                      labelText:
                          'Ingrese Beneficio Y Necesidad', //texto del campo
                    ),
                  ),
                ),
                //---------------------------
                //campos del formulario
                Padding(
                  //control de las areas con bordes
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: TextFormField(
                    controller: txtCampo5, //controlador de campo de texto
                    //informacion de decoracion
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(), // borde
                      labelText: 'Ingrese Area De Impacto', //texto del campo
                    ),
                  ),
                ),

                //-------------------------
                //boton de envio de datos de formulario
                //2:18:50 hora min seg /// 2022-06-07

                TextButton(
                  //titulo del boton de envio de datos al formulario
                  child: const Text('Crear Proyecto'),
                  onPressed: () {
                    estadoem = 'Presentado';
                    estadop = 'Presentado';
                    //añade el dato en la base de datos
                    addRegistro();
                    //para limpiar la linea de insertar datos
                    txtCampo1.text = "";
                    txtCampo2.text = "";
                    txtCampo3.text = "";
                    txtCampo4.text = "";
                    txtCampo5.text = "";
                  },
                )

                //-------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
