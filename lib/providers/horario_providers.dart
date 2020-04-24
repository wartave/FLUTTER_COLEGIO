import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:master_solution/modelo/Horario.dart';
import 'package:master_solution/modelo/estudiante.dart';

class HorarioProvider {
  String _url = 'http://192.168.0.107:3000/';
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<bool> addHorario(dynamic horario) async {
    bool estado = true;

    final http.Response response = await http.post(
      _url + 'addHorario',
      headers: headers,
      body: jsonEncode(horario),
    );
    if (response.statusCode != 201) estado = false;

    return estado;
  }

  Future<List<Horario>> getHorarios(String filtro) async {
    String url = _url + 'getHorarios/' + filtro;
    return await _procesarRespuesta(url);
  }

  Future<List<dynamic>> getHorariosEstudiante(String filtro) async {
    String url = _url + 'getHorariosEstudiante/inscriptos/' + filtro;
    return await _procesarRespuestaEstudiante(url);
  }

  Future<List<Horario>> _procesarRespuesta(String url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final horarios = new Horarios.fromJsonList(decodedData['results']);
    return horarios.items;
  }

  Future<List<dynamic>> _procesarRespuestaEstudiante(String url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final horarios =
        new EstudiantesHorarios.fromJsonList(decodedData['results']);
    return horarios.items;
  }
}

class EstudiantesHorarios {
  List<EstudianteHorario> items = new List();

  EstudiantesHorarios();

  EstudiantesHorarios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final estudainte = new EstudianteHorario.fromJsonMap(item);
      items.add(estudainte);
    }
  }
}

class EstudianteHorario {
  String id;
  String nombre;
  String grado;
  String fechaNacimiento;
  String inscripto;

  EstudianteHorario({String id, String nombre, String grado, String inscripto});

  EstudianteHorario.fromJsonMap(Map<String, dynamic> json) {
    id = json['_id'];
    nombre = json['nombre'];
    grado = json['grado'];
    inscripto = json['inscripto'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'grado': grado,
      'inscripto': inscripto,
    };
  }
}
