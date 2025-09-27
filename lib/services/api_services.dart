import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherappg13/models/forecast_model.dart';
import 'package:weatherappg13/models/weather_model.dart';
import 'package:logger/logger.dart';

class ApiServices {
  Logger logger = Logger();

  Future<void> getWeatherInfo() async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=Lima&aqi=no",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("-----------------------------");
      print(response);
      print(response.statusCode);
      print(response.body);
      print("-----------------------------");
    } else {
      throw Exception("Error al cargar: ${response.statusCode}");
    }
  }

  Future<WeatherModel?> getWeatherInfoByPos(double lat, double long) async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=$lat,$long&aqi=no",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(data);
        // print(data);
        print(weatherModel);
        print(weatherModel.location.name);
        return weatherModel;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<WeatherModel?> getWeatherInfoByName(String city) async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=$city&aqi=no",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(data);
        // print(data);
        print(weatherModel);
        print(weatherModel.location.name);
        return weatherModel;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ForecastModel?> getForecastInfoByName(String city) async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=70866d7ade244a3c9ca20142230509&q=$city&days=1&aqi=no&alerts=no",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        ForecastModel forecastModel = ForecastModel.fromJson(data);
        // print(data);
        print(forecastModel);
        print(forecastModel.location.name);
        return forecastModel;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ForecastModel?> getForecastInfoByPos(double lat, double long) async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=70866d7ade244a3c9ca20142230509&q=$lat,$long&days=1&aqi=no&alerts=no",
    );
    logger.d("holaaaaaaa");

    try {
      print("asdasdasd");

      final response = await http.get(url);
      logger.i(response.body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        ForecastModel forecastModel = ForecastModel.fromJson(data);
        print(data);
        print(forecastModel);
        print(forecastModel.location.name);
        return forecastModel;
      }
    } catch (e) {
      print("error $e");
    }
  }
}
