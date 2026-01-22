class TransacaoModel {
  final String id;
  final String titulo;
  final double valor;
  final String categoria;
  final String description;
  final DateTime data;
  final bool isDespesa;

  TransacaoModel({
    required this.id,
    required this.titulo,
    required this.valor,
    required this.categoria,
    required this.data,
    required this.isDespesa,
    required this.description,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'titulo': titulo,
    'valor': valor,
    'categoria': categoria,
    'description': description,
    'data': data.toIso8601String(),
    'isDespesa': isDespesa,
  };

  factory TransacaoModel.fromMap(Map map) => TransacaoModel(
    id: map['id'],
    titulo: map['titulo'],
    valor: map['valor'],
    categoria: map['categoria'],
    data: DateTime.parse(map['data']),
    isDespesa: map['isDespesa'],
    description: map['description'],
  );
}
