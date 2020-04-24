import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:master_solution/modelo/Horario.dart';

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

  Future<List<Horario>> _procesarRespuesta(String url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final horarios = new Horarios.fromJsonList(decodedData['results']);
    return horarios.items;
  }
}
