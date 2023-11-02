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

class GradientBackgroundContainer extends StatelessWidget {
  final SingleChildScrollView pageData;

  const GradientBackgroundContainer({Key? key, required this.pageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.75, 0.98],
            // Add one stop for each color. Stops should increase from 0 to 1
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.white,
              Colors.indigoAccent,
            ],
          ),
        ),
        child: pageData);
  }
}

class ThreePercentVertSizedBox extends StatelessWidget {
  const ThreePercentVertSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
  }
}

class FivePercentVertSizedBox extends StatelessWidget {
  const FivePercentVertSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}

class OnePercentVertSizedBox extends StatelessWidget {
  const OnePercentVertSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}

class CircularProgress extends StatelessWidget {
  final double? height;
  final double? width;
  final Color color;

  const CircularProgress(
      {required this.height,
      required this.width,
      required this.color,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: height,
          height: width,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color))),
    );
  }
}
