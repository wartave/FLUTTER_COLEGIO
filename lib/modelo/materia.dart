class Materias {
  List<Materia> items = new List();

  Materias();

  Materias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final materia = new Materia.fromJsonMap(item);
      items.add(materia);
    }
  }
}

class Materia {
  String id;
  String nombre;
  String codigo;

  Materia({String id, String nombre, String codigo});

  Materia.fromJsonMap(Map<String, dynamic> json) {
    print(json);
    id = json['_id'];
    nombre = json['nombre'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'codigo': codigo,
    };
  }
}
