import 'package:flutter/material.dart';

class HintTextCustom extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;

  const HintTextCustom({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'Lexend',
            fontSize: 20,
          ),
        ),

        Material(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          elevation: 3,
          child: TextField(
            obscureText: obscure,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[350],
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
                fontFamily: 'Lexend',
                fontSize: 20,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
