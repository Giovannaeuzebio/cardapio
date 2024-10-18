import 'package:flutter/material.dart';
import 'view/cardapio_page.dart';
 
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio Restaurante Show',
      theme: ThemeData(
primarySwatch: Colors.pink,
      ),
      home: CardapioPage(),
    );
  }
}