class Horarios {
  List<Horario> items = new List();

  Horarios();

  Horarios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final horario = new Horario.fromJsonMap(item);
      items.add(horario);
    }
  }
}

class Horario {
  String id;
  String descripcion;
  String horaInicial;
  String horaFinal;
  String diaSemana;
  String curso;
  String id_materia;
  String id_aula;

  Horario({
    String id,
    String descripcion,
    String horaInicial,
    String horaFinal,
    String diaSemana,
    String curso,
    String id_materia,
    String id_aula,
  });

  Horario.fromJsonMap(Map<String, dynamic> json) {
    id = json['_id'];
    descripcion = json['descripcion'];
    horaInicial = json['horaInicial'];
    horaFinal = json['horaFinal'];
    diaSemana = json['diaSemana'];
    curso = json['curso'];
    id_materia = json['id_materia'];
    id_aula = json['id_aula'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
      'horaInicial': horaInicial,
      'horaFinal': horaFinal,
      'diaSemana': diaSemana,
      'id_aula': id_aula,
      'id_materia': id_materia,
    };
  }
}
