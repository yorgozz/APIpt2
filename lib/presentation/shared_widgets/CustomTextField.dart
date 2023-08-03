import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  bool obscureText;
  final TextInputType keyboardType;

  CustomTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: TextField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 0,
            child: Text(
              widget.labelText,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
