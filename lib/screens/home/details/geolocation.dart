import 'package:flutter/material.dart';

class Geolocation extends StatefulWidget {
  const Geolocation({super.key});

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Location"),
    );
  }
}

