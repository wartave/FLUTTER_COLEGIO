import 'package:flutter/material.dart';
import 'package:master_solution/widgets/customButton.dart';
import 'package:master_solution/widgets/customDropDown.dart';
import 'package:master_solution/widgets/customTextfield.dart';

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

class FormularioHorarioEst extends StatefulWidget {
  FormularioHorarioEst({Key key}) : super(key: key);

  @override
  _FormularioHorarioEstState createState() => _FormularioHorarioEstState();
}

class _FormularioHorarioEstState extends State<FormularioHorarioEst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Estudiante',
              style: TextStyle(fontSize: 25),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Horario seleccionado',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  labelText: 'Estudiante',
                  keyboardType: TextInputType.text,
                  onChanged: null),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  labelText: 'Grado',
                  keyboardType: TextInputType.text,
                  onChanged: null),
              SizedBox(
                height: 40,
              ),
              _resultados(),
              CustomButton(
                  imgUri: 'assets/img/register.png',
                  text: 'CREAR',
                  onTap: null,
                  width: 150,
                  fontSize: 25)
            ],
          ),
        ),
      ),
    );
  }

  _resultados() {
    return Container(
        child: Column(
      children: <Widget>[
        ...alumnos.map((item) {
          return GestureDetector(
            child: customListTile(item, 'apellido', 'grado'),
            onTap: () {},
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
