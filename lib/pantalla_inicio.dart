import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pantalla_clima.dart';

const apiKey = '638ab06bf7723f4d9b4826177939b6c2';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio();

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  double latitud = 0.0;
  double longitud = 0.0;

  @override
  void initState() {
    super.initState();
    getUbicacion();
  }

  void getUbicacion() async {
    try {
      LocationPermission permiso1 = await Geolocator.checkPermission();
      LocationPermission permiso2 = await Geolocator.requestPermission();
      Position posicion =
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitud = posicion.latitude;
      longitud = posicion.longitude;
      print(latitud);
      print(longitud);
      getDatos();
    } catch (e) {
      print(e);
    }
  }

  void getDatos() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitud&lon=$longitud&appid=$apiKey&units=metric"));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      Map<String, dynamic> weatherData = jsonDecode(data);
      String ciudad = weatherData['name'];
      double temperatura = weatherData['main']['temp'];
      double sensacionT = weatherData['main']['feels_like'];
      String descripcion = weatherData['weather'][0]['description'];
      int humedad = weatherData['main']['humidity'];
      double viento = weatherData['wind']['speed'];

      print(ciudad);
      print(temperatura);
      print(sensacionT);
      print(descripcion);
      print(humedad);
      print(viento);

      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PantallaClima(
            ciudad: ciudad,
            temperatura: temperatura,
            sensacionT: sensacionT,
            descripcion: descripcion,
            humedad: humedad,
            viento: viento,
          );
        }));
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}