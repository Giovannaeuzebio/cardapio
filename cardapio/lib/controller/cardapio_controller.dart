import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cardapio/model/cardapio_item.dart';
 
class CardapioController {
  Future<List<CardapioItem>> fetchCardapio() async {
final response = await http.get(Uri.parse('https://estevaorada.com/aulas/cardapio'));
 
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => CardapioItem.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao carregar o cardápio');
    }
  }
}