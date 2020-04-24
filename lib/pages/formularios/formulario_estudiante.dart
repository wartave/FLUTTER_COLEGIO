import 'package:flutter/material.dart';
import 'package:master_solution/providers/estudiante_provider.dart';
import 'package:master_solution/widgets/customButton.dart';
import 'package:master_solution/widgets/customTextfield.dart';

class FormularioEstudiante extends StatefulWidget {
  FormularioEstudiante({Key key}) : super(key: key);

  @override
  _FormularioEstudianteState createState() => _FormularioEstudianteState();
}

class _FormularioEstudianteState extends State<FormularioEstudiante> {
  String _nombreCompleto;
  String _grado;
  String _fechaNacimiento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 148, 242, 1.0),
        title: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Estudiante',
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
                child: new Image.asset('assets/img/buho.jpg'),
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                  labelText: 'Nombre',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      _nombreCompleto = value;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime(DateTime.now().year - 18,
                              DateTime.now().month, DateTime.now().day),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(DateTime.now().year - 18,
                              DateTime.now().month, DateTime.now().day))
                      .then((date) {
                    setState(() {
                      _fechaNacimiento = date as String;
                    });
                  });
                },
                child: AbsorbPointer(
                  child: CustomTextField(
                      labelText: 'Fecha',
                      text: _fechaNacimiento,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _fechaNacimiento = value;
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  labelText: 'Grado',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      _grado = value;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  imgUri: 'assets/img/register.png',
                  text: 'CREAR',
                  onTap: () async {
                    final estudianteProvider = new EstudianteProvider();

                    await estudianteProvider.addEstudiante({
                      "nombreCompleto": _nombreCompleto,
                      "grado": _grado,
                    });

                    _nombreCompleto = "";
                    _grado = "";
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
