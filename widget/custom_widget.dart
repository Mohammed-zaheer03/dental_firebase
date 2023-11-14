import 'package:flutter/material.dart';


InputDecoration ourTextfieldColor({required Icon prefixIcon, required String hintText}) {
  return InputDecoration(
    constraints: const BoxConstraints(maxHeight: 60, minHeight: 60),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: Colors.blueAccent.shade700,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: Colors.pink.shade300,
        width: 2,
      ),
    ),
    prefixIcon: prefixIcon,
    hintText: hintText,
    isDense: true,
  );
}

SizedBox ourTextfield({
  required String title,
  required Icon prefixIcon,
  required String hintText,
  bool obscureText = false,
}) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black),
        ),
        const SizedBox(
          height: 3,
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: Colors.blueAccent.shade700,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: Colors.pink.shade300,
                  width: 2,
                ),
              ),
              prefixIcon: prefixIcon,
              hintText: hintText,
            ),
          ),
        ),
      ],
    ),
  );
}
