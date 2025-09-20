import 'package:flutter/material.dart';

class SearchCityWidget extends StatelessWidget {
  TextEditingController controller;

  SearchCityWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Ingresa la ciudad",
        hintStyle: TextStyle(color: Colors.grey.shade700),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "El campo es obligatorio";
        } else {
          return null;
        }
      },
    );
  }
}
