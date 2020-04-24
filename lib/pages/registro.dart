import 'package:flutter/material.dart';
import 'package:master_solution/widgets/customDropDown.dart';
import 'package:master_solution/widgets/customTextfield.dart';

import 'informacion_estudiante.dart';

final alumnos = [
  'Edgar',
  'Victor',
  'Eddy',
  'Samuel',
  'Juan',
  'Jose',
  'Quedate',
  'en',
  'casa',
  'pendejo',
  'de',
  'miercoles',
  'por',
  'la',
  'tarde'
];

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Registro de asistencia',
              style: TextStyle(fontSize: 25),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // _carusel(),
            SizedBox(height: 15),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    CustomDropDown(
                        selectedObject: null,
                        objects: [],
                        hint: 'Seleccione el horario',
                        callBack: null),
                    SizedBox(height: 15),
                    CustomTextField(
                      labelText: 'Curso',
                      keyboardType: TextInputType.text,
                      onChanged: null,
                      enabled: false,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      labelText: 'Materia',
                      keyboardType: TextInputType.text,
                      onChanged: null,
                      enabled: false,
                    ),
                  ],
                )),
            SizedBox(height: 15),
            _resultados()
          ],
        ),
      ),
    );
  }

  // _carusel() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 10),
  //     child: HorizontalCalendar(
  //         padding: EdgeInsets.all(20),
  //         selectedDecoration: BoxDecoration(
  //           color: Color.fromRGBO(106, 148, 242, 1.0),
  //           shape: BoxShape.circle,
  //         ),
  //         defaultDecoration: BoxDecoration(
  //             color: Colors.transparent,
  //             shape: BoxShape.circle,
  //             border: Border.all(width: 1)),
  //         firstDate: toDateMonthYear(DateTime.now()),
  //         lastDate: toDateMonthYear(DateTime.now().add(Duration(days: 30)))),
  //   );
  // }

  _resultados() {
    return Container(
        child: Column(
      children: <Widget>[
        ...alumnos.map((item) {
          return GestureDetector(
            child: customListTile(item, 'apellido', 'grado'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InformacionEstudiante(
                        'nombre', 'apellido', 'grado', true)),
              );
            },
          );
        }).toList(),
      ],
    ));
  }

  Widget customListTile(String nombre, String apellido, String grado) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.person_outline,
              size: 50,
            ),
            trailing: Container(
              width: 100,
              height: 30,
              child: CustomDropDown(
                  selectedObject: null, objects: [], hint: '', callBack: null),
            ),
            title: Text(nombre),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(apellido), Text(grado)],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
