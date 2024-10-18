import 'package:cardapio/controller/cardapio_controller.dart';
import 'package:flutter/material.dart';
import 'package:cardapio/model/cardapio_item.dart';

class CardapioPage extends StatefulWidget {
  @override
  _CardapioPageState createState() => _CardapioPageState();
}

class _CardapioPageState extends State<CardapioPage> {
  final CardapioController controller = CardapioController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio Restaurante Show'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 16),
                const Text(
                  'Restaurante Show',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<CardapioItem>>(
              future: controller.fetchCardapio(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar o cardápio'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhum item disponível'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(item.foto, width: 50, height: 50),
                        title: Text(item.nome),
                        subtitle: Text(item.descricao),
                        trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
