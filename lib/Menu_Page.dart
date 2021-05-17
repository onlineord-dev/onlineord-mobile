import 'package:flutter/material.dart';
import 'JsonParseMenu.dart';

class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonParseMenu(),
    );
  }
}