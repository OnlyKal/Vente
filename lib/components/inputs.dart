import 'package:flutter/material.dart';

Widget input(label, hintText, controller) {
  return Column(
    children: [
      TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
      const SizedBox(
        height: 13,
      )
    ],
  );
}

Widget inputPass(label, hintText, controller) {
  return Column(
    children: [
      TextField(
        obscureText: true,
        maxLength: 12,
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
      const SizedBox(
        height: 13,
      )
    ],
  );
}
