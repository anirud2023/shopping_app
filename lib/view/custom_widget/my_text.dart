import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String name;
  final double Size;
  final FontWeight? fontWeight;
  final Color? color;

  const TextBox({
    Key? key,
    required this.name,
    required this.Size,
    this.color=Colors.black,
    this.fontWeight=FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name,style: TextStyle(fontWeight:fontWeight,fontSize: Size,color: color,fontFamily: 'Raleway'),);
  }
}
