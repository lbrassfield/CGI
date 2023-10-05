import 'package:flutter/material.dart';

class MediaType extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const MediaType({Key? key, required this.mobile, required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 500) {
      return mobile;
    } else {
      return desktop;
    }
  }
}
