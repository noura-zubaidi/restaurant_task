import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double borderRadius;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;

  const CustomTextField(
      {Key? key,
      this.width = 345.0,
      this.borderRadius = 8.0,
      this.prefixIcon,
      required this.hintText,
      this.suffixIcon,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          suffixIconColor: Colors.grey.shade500,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.grey.shade100,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          prefixIconColor: Colors.grey.shade500,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
