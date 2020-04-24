import 'package:flutter/material.dart';
import 'package:master_solution/providers/materia_provider.dart';
import 'package:master_solution/widgets/customButton.dart';
import 'package:master_solution/widgets/customTextfield.dart';

class FormularioMateria extends StatefulWidget {
  FormularioMateria({Key key}) : super(key: key);

  @override
  _FormularioMateriaState createState() => _FormularioMateriaState();
}

class _FormularioMateriaState extends State<FormularioMateria> {
  String _nombre;
  String _codigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Materia',
              style: TextStyle(fontSize: 25),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 35),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/img/Info estudiante.png'),
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                  labelText: 'Código',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      _codigo = value;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  labelText: 'Materia',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  }),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                  imgUri: 'assets/img/register.png',
                  text: 'CREAR',
                  onTap: () async {
                    final materiaProvider = new MateriaProvider();

                    await materiaProvider.addMateria({
                      "nombre": _nombre,
                      "codigo": _codigo,
                    });
                    _nombre = "";
                    _codigo = "";
                    setState(() {});
                  },
                  width: 150,
                  fontSize: 25)
            ],
          ),
        ),
      ),
    );
  }
}
