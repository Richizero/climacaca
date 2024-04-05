import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';

void main() => runApp(testClima());

class testClima extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PantallaInicio(),
    );
  }
}