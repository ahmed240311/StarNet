import 'package:flutter/material.dart';

TextStyle styleCat = TextStyle(
    fontSize: 18.0,
    color: Colors.black87,
    fontFamily: 'Cairo-Black',
    fontWeight: FontWeight.w600);
final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xff3C91AB), Color(0xffFFFFFF)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
class Style extends StatelessWidget {
  var _text;
  TextStyle _style;

  Style(this._text, this._style);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      _text,
      style: _style,
    );
  }
}
