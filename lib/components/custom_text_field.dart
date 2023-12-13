import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;

  CustomTextField({super.key, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 5,
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          //remove underline
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
