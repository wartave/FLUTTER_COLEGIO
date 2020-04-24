import 'package:flutter/material.dart';
import 'package:master_solution/pages/consultas.dart';
import 'package:master_solution/pages/formularios/formulario_estudiante.dart';
import 'package:master_solution/pages/formularios/formulario_horario.dart';
import 'package:master_solution/pages/formularios/formulario_horarioEst.dart';
import 'package:master_solution/pages/formularios/formulario_matera.dart';
import 'package:master_solution/pages/menu.dart';
import 'package:master_solution/pages/registro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Solution',
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => Menu(),
        '/horario': (context) => FormularioHorario(),
        '/registro': (context) => Registro(),
        '/ventanaConsultas': (context) => VentanaConsultas(),
        '/formMateria': (context) => FormularioMateria(),
        '/formEstudiante': (context) => FormularioEstudiante(),
        '/formHorarioEst': (context) => FormularioHorarioEst()
      },
    );
  }
}
