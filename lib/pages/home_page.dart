import 'package:flutter/material.dart';
import 'package:weatherappg13/widgets/search_city_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent,
                ),
                child: Column(
                  children: [
                    Text("Lima, Perú", style: TextStyle(color: Colors.white)),
                    Image.asset("assets/icons/heavycloudy.png"),
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
