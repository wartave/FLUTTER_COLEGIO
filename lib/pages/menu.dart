import 'package:flutter/material.dart';
import 'package:master_solution/search/consultas.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 231, 225, 1.0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 300,
                  child: Image.asset('assets/img/buho.jpg'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _crearBoton('assets/img/icono horario.png', 'Horario', () {
                    showSearch(
                        context: context,
                        delegate:
                            ConsultarEstudiantes(tipo: tipoDeBusqueda.horario));
                  }),
                  _crearBoton(
                      'assets/img/Info estudiante.png', 'Info. estudiante', () {
                    showSearch(
                        context: context,
                        delegate:
                            ConsultarEstudiantes(tipo: tipoDeBusqueda.alumno));
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _crearBoton('assets/img/register.png', 'Reg. asistencia', () {
                    Navigator.pushNamed(context, '/registro');
                  }),
                  _crearBoton('assets/img/grade.png', 'Calificaciones', () {
                    print('Horario');
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _crearBoton('assets/img/register.png', 'Materia', () {
                    showSearch(
                        context: context,
                        delegate:
                            ConsultarEstudiantes(tipo: tipoDeBusqueda.materia));
                  }),
                  _crearBoton('assets/img/grade.png', 'Aula', () {
                    showSearch(
                        context: context,
                        delegate:
                            ConsultarEstudiantes(tipo: tipoDeBusqueda.aula));
                  })
                ],
              )
            ],
          ),
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
