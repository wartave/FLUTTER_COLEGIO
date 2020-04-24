import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:master_solution/modelo/materia.dart';

class MateriaProvider {
  String _url = 'http://192.168.0.107:3000/';
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<bool> addMateria(dynamic materia) async {
    bool estado = true;

    final http.Response response = await http.post(
      _url + 'addMateria',
      headers: headers,
      body: jsonEncode(materia),
    );
    if (response.statusCode != 201) estado = false;

    return estado;
  }

  Future<List<Materia>> getMaterias(String filtro) async {
    String url = _url + 'getMaterias/' + filtro;
    return await _procesarRespuesta(url);
  }

  Future<List<Materia>> _procesarRespuesta(String url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final materias = new Materias.fromJsonList(decodedData['results']);

    return materias.items;
  }
}
