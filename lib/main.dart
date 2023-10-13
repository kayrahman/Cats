import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_dart/apimodule/api_service.dart';
import 'package:learning_dart/drawer.dart';
import 'package:learning_dart/pages/MyHomePage.dart';

void main() {
  //MaterialApp(home: MyHomePage());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BJIT Academy',
      theme: ThemeData(
       /* colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,*/
        primarySwatch: Colors.purple
      ),
      home: MyHomePage(),
    );
  }
}

