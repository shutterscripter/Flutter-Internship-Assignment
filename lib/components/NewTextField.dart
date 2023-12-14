import 'package:flutter/material.dart';

class TF extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  IconData icon;
  TextInputType keyboardType;

  TF(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.icon});

  @override
  State<TF> createState() => _TFState();
}

class _TFState extends State<TF> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
