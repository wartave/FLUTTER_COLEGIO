import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:master_solution/modelo/estudiante.dart';

class EstudianteProvider {
  String _url = 'http://192.168.0.107:3000/';
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<bool> addEstudiante(dynamic estudiante) async {
    bool estado = true;

    final http.Response response = await http.post(
      _url + 'addEstudiante',
      headers: headers,
      body: jsonEncode(estudiante),
    );
    if (response.statusCode != 201) estado = false;

    return estado;
  }

  Future<List<Estudiante>> getEstudiantes(String filtro) async {
    String url = _url + 'getEstudiantes/' + filtro;
    return await _procesarRespuesta(url);
  }

  Future<List<Estudiante>> _procesarRespuesta(String url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final estudiantes = new Estudiantes.fromJsonList(decodedData['results']);

    return estudiantes.items;
  }
}
