import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Input extends StatelessWidget {
  final String textoPlaceholder;
  final IconData icon;
  final TextEditingController controller;
  final bool isSenha;

  const Input(
    this.textoPlaceholder,
    this.icon,
    this.isSenha,
    this.controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: isSenha,
        decoration: InputDecoration(
          labelText: textoPlaceholder,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(icon, color: Colors.black87),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? textoPlaceholder : null,
      ),
    );
  }
}
