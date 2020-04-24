import 'package:flutter/material.dart';
import 'package:master_solution/modelo/estudiante.dart';
import 'package:master_solution/providers/horario_providers.dart';
import 'package:master_solution/widgets/customButton.dart';
import 'package:master_solution/widgets/customDropDown.dart';
import 'package:master_solution/widgets/customTextfield.dart';

class FormularioHorarioEst extends StatefulWidget {
  FormularioHorarioEst({Key key, this.nombre, this.idHorario})
      : super(key: key);

  final String nombre;
  final String idHorario;

  @override
  _FormularioHorarioEstState createState() => _FormularioHorarioEstState();
}

class _FormularioHorarioEstState extends State<FormularioHorarioEst> {
  final horariosProvider = new HorarioProvider();

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
      body: FutureBuilder(
          future: horariosProvider.getHorariosEstudiante(widget.idHorario),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              final alumnos = snapshot.data;

              return SingleChildScrollView(
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
                      Text(
                        widget.nombre,
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
                      _resultados(alumnos),
                      CustomButton(
                          imgUri: 'assets/img/register.png',
                          text: 'CREAR',
                          onTap: null,
                          width: 150,
                          fontSize: 25)
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  _resultados(List<dynamic> alumnos) {
    return Container(
        child: Column(
      children: <Widget>[
        ...alumnos.map((item) {
          return GestureDetector(
            child: customListTile(item.nombre, item.grado, item.inscripto),
            onTap: () {},
          );
        }).toList(),
      ],
    ));
  }

  Widget customListTile(String nombre, String grado, String inscripto) {
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
                  selectedObject: inscripto,
                  objects: ["INSCRIPTO", "INSCRIBIR"],
                  hint: "",
                  callBack: null),
            ),
            title: Text(nombre),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(grado)],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
