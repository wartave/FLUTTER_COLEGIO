import 'package:flutter/material.dart';
import 'package:master_solution/providers/horario_providers.dart';
import 'package:master_solution/widgets/customButton.dart';
import 'package:master_solution/widgets/customDropDown.dart';
import 'package:master_solution/widgets/customTextfield.dart';

class FormularioHorario extends StatefulWidget {
  FormularioHorario({Key key}) : super(key: key);

  @override
  _FormularioHorarioState createState() => _FormularioHorarioState();
}

class _FormularioHorarioState extends State<FormularioHorario> {
  String _descripcion;
  String _horarioInicial;
  String _horarioFinal;
  String _diaSemana;
  String _idCurso;
  String _idMateria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Horario',
              style: TextStyle(fontSize: 25),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // _carusel(),

                CustomTextField(
                    labelText: 'Descripción',
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _descripcion = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    labelText: 'Hora inicial',
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _horarioInicial = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    labelText: 'Hora inicial',
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _horarioFinal = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomDropDown(
                    selectedObject: "Lunes",
                    objects: [
                      "Lunes",
                      "Martes",
                      "Miercoles",
                      "Jueves",
                      "Viernes",
                      "Sabado",
                      "Domingo"
                    ],
                    hint: 'Día semana',
                    callBack: (value) {
                      setState(() {
                        _diaSemana = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    labelText: 'Curso',
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _idCurso = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    labelText: 'Materia',
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _idMateria = value;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    imgUri: 'assets/img/register.png',
                    text: 'CREAR',
                    onTap: () async {
                      final horarioProvider = new HorarioProvider();

                      print(_descripcion);
                      await horarioProvider.addHorario({
                        "descripcion": _descripcion,
                        "horario_inicial": _horarioInicial,
                        "horario_final": _horarioFinal,
                        "dia_semana": _diaSemana,
                        "id_materia": _idMateria,
                        "id_aula": _idCurso
                      });

                      setState(() {
                        _descripcion = '';
                        _horarioFinal = '';
                        _horarioFinal = '';
                        _diaSemana = '';
                        _idMateria = '';
                        _idCurso = '';
                      });
                    },
                    width: 150,
                    fontSize: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _carusel() {
  //   return HorizontalCalendar(
  //       padding: EdgeInsets.all(20),
  //       selectedDecoration: BoxDecoration(
  //         color: Color.fromRGBO(106, 148, 242, 1.0),
  //         shape: BoxShape.circle,
  //       ),
  //       defaultDecoration: BoxDecoration(
  //           color: Colors.transparent,
  //           shape: BoxShape.circle,
  //           border: Border.all(width: 1)),
  //       firstDate: toDateMonthYear(DateTime.now()),
  //       lastDate: toDateMonthYear(DateTime.now().add(Duration(days: 30))));
  // }
}
