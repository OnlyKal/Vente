import 'package:flutter/material.dart';

double height(context, value) {
  return MediaQuery.of(context).size.height * value;
}
double width(context, value) {
  return MediaQuery.of(context).size.width * value;
}
