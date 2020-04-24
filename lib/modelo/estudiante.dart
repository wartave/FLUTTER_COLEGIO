class Estudiantes {
  List<Estudiante> items = new List();

  Estudiantes();

  Estudiantes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final estudainte = new Estudiante.fromJsonMap(item);
      items.add(estudainte);
    }
  }
}

class Estudiante {
  String id;
  String nombreCompleto;
  String grado;
  String fechaNacimiento;

  Estudiante(
      {String id, String nombreCompleto, String grado, String fechaNacimiento});

  Estudiante.fromJsonMap(Map<String, dynamic> json) {
    id = json['_id'];
    nombreCompleto = json['nombreCompleto'];
    fechaNacimiento = json['fechaNacimiento'];
    grado = json['grado'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombreCompleto': nombreCompleto,
      'grado': grado,
    };
  }
}
