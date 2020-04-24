class Aulas {
  List<Aula> items = new List();

  Aulas();

  Aulas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final aula = new Aula.fromJsonMap(item);
      items.add(aula);
    }
  }
}

class Aula {
  String id;
  String nombre;
  String codigo;

  Aula({String id, String nombre, String codigo});

  Aula.fromJsonMap(Map<String, dynamic> json) {
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
