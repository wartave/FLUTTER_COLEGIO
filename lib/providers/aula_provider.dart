import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:master_solution/modelo/aula.dart';

class AulaProvider {
  String _url = 'http://192.168.0.107:3000/';
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<bool> addAula(dynamic aula) async {
    bool estado = true;

    final http.Response response = await http.post(
      _url + 'addAula',
      headers: headers,
      body: jsonEncode(aula),
    );
    if (response.statusCode != 201) estado = false;

    return estado;
  }

  Future<List<Aula>> getAulas(String filtro) async {
    String url = _url + 'getAulas/' + filtro;
    return await _procesarRespuesta(url);
  }

  Future<List<Aula>> _procesarRespuesta(String url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final aulas = new Aulas.fromJsonList(decodedData['results']);

    return aulas.items;
  }
}
