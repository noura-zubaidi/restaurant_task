import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final double width;
  final double borderRadius;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextField({
    Key? key,
    this.width = 345.0,
    this.borderRadius = 8.0, this.prefixIcon, required this.hintText, this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(

        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon!=null ? Icon(suffixIcon): null ,
          suffixIconColor: Colors.grey.shade500,
          hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
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