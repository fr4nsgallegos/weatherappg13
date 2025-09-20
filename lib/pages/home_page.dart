import 'package:flutter/material.dart';
import 'package:weatherappg13/services/api_services.dart';
import 'package:weatherappg13/widgets/search_city_widget.dart';
import 'package:weatherappg13/widgets/weather_item.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<Position?> getPosition() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    // VERIFICAMOS QUE EL SERVICIO ESTE HABILITADO
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      print("Los servicios de ubicación estan deshabilitados");
      return null;
    }

    // Verificando los permisos
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("Permiso de ubicación denegado");
        return null;
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      print("Los permisos de ubicación estan permanentemente denegados");
      return null;
    }

    // OBTENER LA UBICACIÓN DEL DISPOSITIVO
    try {
      Position position = await Geolocator.getCurrentPosition();
      print("Posicion: $position");
      return position;
    } catch (e) {
      print("Error al obtener ubicación: $e");
      return null;
    }
  }

  Future<void> getWeatherFromPosition() async {
    Position? _pos = await getPosition();
    if (_pos == null) {
      print("No se pudo obtener la ubicación");
      return;
    }

    ApiServices().getWeatherInfoByPos(_pos.latitude, _pos.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getPosition();
          // ApiServices apiServices = ApiServices();
          // apiServices.getWeatherInfo();
          getWeatherFromPosition();
        },
      ),
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        title: Text("WeatherApp"),
        centerTitle: true,
        backgroundColor: Color(0xff2C2F31),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_on_outlined, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Color(0xff2C2F31),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchCityWidget(controller: cityController),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent,
                ),
                child: Column(
                  children: [
                    Text(
                      "Lima, Perú",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 32),
                    Image.asset("assets/icons/heavycloudy.png", height: 100),
                    Text(
                      "23.9°",
                      style: TextStyle(color: Colors.white, fontSize: 100),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherItem(
                          value: 18,
                          unit: "km/h",
                          image: "windspeed",
                        ),
                        WeatherItem(value: 76, unit: "%", image: "humidity"),
                        WeatherItem(value: 58, unit: "%", image: "cloud"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
