import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key key,
      @required this.selectedObject,
      this.isExpanded = true,
      @required this.objects,
      @required this.hint,
      @required this.callBack})
      : super(key: key);

  final Function callBack;
  final String selectedObject;
  final String hint;
  final List<String> objects;
  final bool isExpanded;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: DropdownButton<String>(
        underline: Container(
          width: 0,
          height: 0,
        ),
        isExpanded: widget.isExpanded,
        elevation: 20,
        focusColor: Colors.black,
        hint: Text(
          widget.hint,
          style: TextStyle(color: Colors.grey),
        ),
        value: widget.selectedObject,
        items: widget.objects.map((object) {
          return DropdownMenuItem<String>(
            value: object,
            child: Text(object),
          );
        }).toList(),
        onChanged: widget.callBack,
      ),
    );
  }
}
