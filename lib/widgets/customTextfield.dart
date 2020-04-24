import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key key,
    @required this.labelText,
    @required this.keyboardType,
    @required this.onChanged,
    this.text,
    this.validator,
    this.maxLength,
    this.enabled,
    this.suffixIcon,
  }) : super(key: key);

  final String labelText;
  final TextInputType keyboardType;
  final Function onChanged;
  final Function validator;
  final String text;
  final int maxLength;
  final bool enabled;
  final Widget suffixIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: (widget.enabled != null) ? widget.enabled : null,
      onChanged: widget.onChanged,
      maxLength: (widget.maxLength != null) ? widget.maxLength : null,
      controller: (widget.text != null)
          ? TextEditingController(text: widget.text)
          : null,
      decoration: new InputDecoration(
        suffixIcon: (widget.suffixIcon != null) ? widget.suffixIcon : null,
        labelText: widget.labelText,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
