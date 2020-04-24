import 'package:flutter/material.dart';
import 'package:master_solution/modelo/aula.dart';
import 'package:master_solution/modelo/estudiante.dart';
import 'package:master_solution/modelo/materia.dart';
import 'package:master_solution/pages/formularios/formulario_aula.dart';
import 'package:master_solution/pages/formularios/formulario_estudiante.dart';
import 'package:master_solution/pages/formularios/formulario_horario.dart';
import 'package:master_solution/pages/formularios/formulario_matera.dart';
import 'package:master_solution/pages/informacion_estudiante.dart';
import 'package:master_solution/providers/aula_provider.dart';
import 'package:master_solution/providers/estudiante_provider.dart';
import 'package:master_solution/providers/horario_providers.dart';
import 'package:master_solution/providers/materia_provider.dart';

enum tipoDeBusqueda { alumno, aula, materia, horario }

class ConsultarEstudiantes extends SearchDelegate {
  final estudiantesProvider = new EstudianteProvider();
  final materiasProvider = new MateriaProvider();
  final aulasProvider = new AulaProvider();
  final horarioProvider = new HorarioProvider();

  final tipoDeBusqueda tipo;

  ConsultarEstudiantes({@required this.tipo});

  @override
  String get searchFieldLabel =>
      'Buscar ' +
      ((tipo == tipoDeBusqueda.alumno)
          ? "alumno"
          : (tipo == tipoDeBusqueda.aula)
              ? "aula"
              : (tipo == tipoDeBusqueda.horario) ? "horario" : "materia");

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => query = ""),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, false);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return InformacionEstudiante('nombre', 'apellido', 'grado', false);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ((tipo == tipoDeBusqueda.alumno)
            ? estudiantesProvider.getEstudiantes(query)
            : (tipo == tipoDeBusqueda.aula)
                ? aulasProvider.getAulas(query)
                : (tipo == tipoDeBusqueda.horario)
                    ? horarioProvider.getHorarios(query)
                    : materiasProvider.getMaterias(query)),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final resp = snapshot.data;

            final dynamic listaSugerida = ((tipo == tipoDeBusqueda.alumno)
                ? alumnosFiltro(resp)
                : (tipo == tipoDeBusqueda.aula)
                    ? aulasFiltro(resp)
                    : (tipo == tipoDeBusqueda.horario)
                        ? horarioFiltro(resp)
                        : materiasFiltro(resp));

            final _screenSize = MediaQuery.of(context).size;

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (tipo == tipoDeBusqueda.alumno) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormularioEstudiante(),
                            ));
                      } else if (tipo == tipoDeBusqueda.horario) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormularioHorario(),
                            ));
                      } else if (tipo == tipoDeBusqueda.materia) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormularioMateria(),
                            ));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormularioAula(),
                            ));
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('Crear nuevo registro'),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                  Container(
                    height: _screenSize.height * 0.90,
                    child: ListView.builder(
                      itemCount: listaSugerida.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          child: informacionRegistro(listaSugerida[i]),
                          onTap: () {
                            showResults(context);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget informacionRegistro(dynamic listaSugerida) {
    return ((tipo == tipoDeBusqueda.alumno)
        ? customListTile(listaSugerida.nombreCompleto,
            listaSugerida.fechaNacimiento, listaSugerida.grado)
        : (tipo == tipoDeBusqueda.aula)
            ? customListTile(listaSugerida.nombre, listaSugerida.codigo, "")
            : (tipo == tipoDeBusqueda.horario)
                ? customListTile(listaSugerida.descripcion,
                    listaSugerida.id_materia, listaSugerida.id_aula)
                : customListTile(
                    listaSugerida.nombre, listaSugerida.codigo, ""));
  }

  Widget customListTile(String titulo, String subtitulo, String complemento) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.person_outline,
              size: 50,
            ),
            title: Text(titulo),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(subtitulo), Text(complemento)],
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  List<Estudiante> alumnosFiltro(List<Estudiante> alumnos) {
    return alumnos
        .where((a) =>
            a.nombreCompleto.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }

  List<Materia> materiasFiltro(List<Materia> materias) {
    return materias
        .where((a) => a.nombre.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }

  List<Aula> aulasFiltro(List<Aula> aulas) {
    return aulas
        .where((a) => a.nombre.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }

  List<dynamic> horarioFiltro(List<dynamic> horarios) {
    return horarios
        .where(
            (a) => a.descripcion.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }
}
