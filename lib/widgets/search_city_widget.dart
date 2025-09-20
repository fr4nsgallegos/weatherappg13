import 'package:flutter/material.dart';

class SearchCityWidget extends StatelessWidget {
  TextEditingController controller;
  VoidCallback function;
  SearchCityWidget({
    super.key,
    required this.controller,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Ingresa la ciudad",
        hintStyle: TextStyle(color: Colors.grey.shade700),
        filled: true,
        suffixIcon: IconButton(
          onPressed: function,
          icon: Icon(Icons.search_rounded, color: Colors.white),
        ),
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
