import 'package:http/http.dart' as http;

class ApiServices {
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
}
