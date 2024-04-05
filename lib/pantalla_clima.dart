import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';

class PantallaClima extends StatefulWidget {
  const PantallaClima({super.key});

  @override
  State<PantallaClima> createState() => _PantallaClimaState();
}

class _PantallaClimaState extends State<PantallaClima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.green[100],
          height: 200.0,
          width: 280.0,
          child: Column(
            children: [
              Text("Ciudad: $ciudad", style: TextStyle(color: Colors.purple),),
            ],
          ),
        ),
      ),
    );
  }
}

/*
child: Column(

),
*/
