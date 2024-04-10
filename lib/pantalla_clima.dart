import 'package:flutter/material.dart';

class PantallaClima extends StatefulWidget {
  final String ciudad;
  final double temperatura;
  final double sensacionT;
  final String descripcion;
  final int humedad;
  final double viento;

  const PantallaClima({
    Key? key,
    required this.ciudad,
    required this.temperatura,
    required this.sensacionT,
    required this.descripcion,
    required this.humedad,
    required this.viento,
  }) : super(key: key);

  @override
  _PantallaClimaState createState() => _PantallaClimaState();
}

class _PantallaClimaState extends State<PantallaClima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima en ${widget.ciudad}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temperatura: ${widget.temperatura}°C',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Sensación térmica: ${widget.sensacionT}°C',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Descripción: ${widget.descripcion}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Humedad: ${widget.humedad}%',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Viento: ${widget.viento} m/s',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
