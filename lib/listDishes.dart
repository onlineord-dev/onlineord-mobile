import 'package:flutter/material.dart';

void main() {
  runApp(ListDishes());
}

class ListDishes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dishes'
    );
  }
}