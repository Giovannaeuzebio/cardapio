class CardapioItem {
  final String nome;
  final String descricao;
  final double preco;
  final String foto;

  CardapioItem({required this.nome, required this.descricao, required this.preco, required this.foto});

  factory CardapioItem.fromJson(Map<String, dynamic> json) {
    return CardapioItem(
      nome: json['nome'],
      descricao: json['descricao'],
      preco: json['preco'],
      foto: json['foto'],
    );
  }
}
