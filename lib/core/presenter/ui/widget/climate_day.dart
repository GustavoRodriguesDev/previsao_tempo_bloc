import 'package:flutter/material.dart';

class ClimateDay extends StatefulWidget {
  final String wind;
  final String temp;
  final double height;
  final double width;
  final String image;
  final String city;
  final String description;

  const ClimateDay({
    required this.description,
    required this.city,
    required this.image,
    required this.height,
    required this.width,
    required this.temp,
    required this.wind,
    Key? key,
  }) : super(key: key);

  @override
  State<ClimateDay> createState() => _ClimateDayState();
}

class _ClimateDayState extends State<ClimateDay> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: widget.height,
        width: widget.width,
        color: const Color(0xFF81B9DD),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                widget.city,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 25),
              Text(
                widget.description,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
                height: widget.width * 0.4,
                width: widget.width * 0.9,
                alignment: Alignment.center,
                child: Image.asset(
                  widget.image,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.temp,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: widget.width * 0.15,
                width: widget.width * 0.15,
                child: Image.asset('assets/icons/wind.png'),
              ),
              const Text(
                'Wind',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.wind,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
          ..lineTo(0, size.height * 0.95)
          ..quadraticBezierTo(size.width * 0.25, size.height * 0.90, size.width * 0.5, size.height * 0.95)
          ..quadraticBezierTo(size.width * 0.75, size.height * 0.98, size.width, size.height * 0.93)
          // ..cubicTo(point1.dx, point1.dy, point2.dx, point2.dy, point3.dy, point3.dx)
          ..lineTo(size.width, 0)

//
        ;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
