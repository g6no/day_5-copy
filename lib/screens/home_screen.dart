import 'dart:convert';

import 'package:day_5/screens/weather-screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var temp = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: 'City',
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                var url = Uri.parse(
                  'http://api.weatherstack.com/current?access_key=bc453117674e67e38b06f53f702f87b6&query=${_textFieldController.text}',
                );
                var response = await http.get(url);

                var objectBody = jsonDecode(response.body);

                var tempCity = objectBody['current']['temperature'];

                /*if (response.statusCode == 200) {
                  setState(() {});
                }*/
                temp = tempCity.toString();
                setState(() {});
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                Container(width: 10),
                Text('Search')
              ],
            ),
          ),
          Stack(
            children: [
              Text(
                temp,
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
        ],
      ),
    );
  }
}
