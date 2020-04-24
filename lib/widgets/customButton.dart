import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {@required this.imgUri,
      @required this.text,
      @required this.onTap,
      this.width,
      this.fontSize});
  final String imgUri;
  final String text;
  final Function onTap;
  final double width;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20.0),
        height: 135,
        width: (width != null) ? width : null,
        decoration: BoxDecoration(
            color: Color.fromRGBO(106, 148, 242, 1.0),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Column(
          children: <Widget>[
            Flexible(child: Image.asset(imgUri)),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (fontSize != null) ? fontSize : 15),
            )
          ],
        ),
      ),
    );
  }
}
