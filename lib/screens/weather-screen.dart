import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  int temp;
  String city;

  WeatherScreen({required this.temp, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Center(
        child: Stack(
          children: [
            Text(
              '$temp',
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Positioned(
              right: 1,
              child: Text(
                '°',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
