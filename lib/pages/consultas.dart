import 'package:flutter/material.dart';
import 'package:master_solution/search/consultas.dart';

class VentanaConsultas extends StatefulWidget {
  VentanaConsultas({Key key}) : super(key: key);

  @override
  _VentanaConsultasState createState() => _VentanaConsultasState();
}

class _VentanaConsultasState extends State<VentanaConsultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 231, 225, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Consultas',
              style: TextStyle(fontSize: 25),
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _crearBoton('assets/img/register.png', 'Consulta de asistencia',
                    () {
                  Navigator.pushNamed(context, '/horario');
                }),
                _crearBoton(
                    'assets/img/grade.png', 'Consulta de calificaciones', () {
                  showSearch(
                      context: context,
                      delegate:
                          ConsultarEstudiantes(tipo: tipoDeBusqueda.alumno));
                })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearBoton(String imgUri, String text, Function onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20.0),
          height: 135,
          decoration: BoxDecoration(
              color: Color.fromRGBO(106, 148, 242, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Column(
            children: <Widget>[
              Flexible(child: Image.asset(imgUri)),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
