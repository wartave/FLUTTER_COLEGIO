import 'package:flutter/material.dart';

class InformacionEstudiante extends StatefulWidget {
  InformacionEstudiante(this.nombre, this.apellido, this.grado, this.appbar);

  final String nombre;
  final String apellido;
  final String grado;
  final bool appbar;

  @override
  _InformacionEstudianteState createState() => _InformacionEstudianteState();
}

class _InformacionEstudianteState extends State<InformacionEstudiante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.appbar)?AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '',
              style: TextStyle(fontSize: 25),
            )),
      ):null,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              informacionEstudiante(),
              crearItem('Fecha de nacimiento', 'UNA FECHA AQUI'),
              crearItem('Nombre de la madre', 'un nombre aquí'),
              crearItem('Nombre del padre', 'un nombre aquí'),
              crearItem('Edad', 'pues la edad'),
              customButtom('Calificaciones', () {}),
              customButtom('Asistencia', () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget informacionEstudiante() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      color: Color.fromRGBO(106, 148, 242, 1.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.person_outline,
            size: 150,
          ),
          SizedBox(height: 10),
          Text(
            widget.nombre + " " + widget.apellido + "\n${widget.grado}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget crearItem(String label, String texto) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(texto, style: TextStyle(color: Colors.black, fontSize: 22)),
          Divider(),
        ],
      ),
    );
  }

  Widget customButtom(String texto, Function function) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
          onPressed: function,
          textColor: Colors.white,
          color: Color.fromRGBO(106, 148, 242, 1.0),
          child: Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                texto,
              ))),
    );
  }
}
