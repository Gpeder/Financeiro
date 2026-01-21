class TransacaoModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final double value;

  TransacaoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.value,
  });
}

List<TransacaoModel> transacoesExemplo = [
  TransacaoModel(
    id: '1',
    title: 'Alimentação',
    description: 'Pizzaria',
    date: DateTime(2024, 7, 27),
    value: 39.00,
  ),
  TransacaoModel(
    id: '2',
    title: 'Alimentação',
    description: 'Supermercado',
    date: DateTime(2024, 7, 28),
    value: 250.00,
  ),
  TransacaoModel(
    id: '3',
    title: 'Alimentação',
    description: 'Padaria',
    date: DateTime(2024, 7, 29),
    value: 18.00,
  ),
  TransacaoModel(
    id: '4',
    title: 'Alimentação',
    description: 'Restaurante',
    date: DateTime(2024, 8, 1),
    value: 75.00,
  ),
  TransacaoModel(
    id: '5',
    title: 'Transporte',
    description: 'Gasolina - Posto Shell',
    date: DateTime(2024, 8, 3),
    value: 120.00,
  ),
  TransacaoModel(
    id: '6',
    title: 'Transporte',
    description: 'Uber',
    date: DateTime(2024, 8, 5),
    value: 25.30,
  ),
  TransacaoModel(
    id: '7',
    title: 'Saúde',
    description: 'Farmácia',
    date: DateTime(2024, 8, 7),
    value: 45.50,
  ),
  TransacaoModel(
    id: '8',
    title: 'Saúde',
    description: 'Academia',
    date: DateTime(2024, 8, 10),
    value: 89.90,
  ),
  TransacaoModel(
    id: '9',
    title: 'Lazer',
    description: 'Cinema',
    date: DateTime(2024, 8, 12),
    value: 60.00,
  ),
  TransacaoModel(
    id: '10',
    title: 'Lazer',
    description: 'Streaming',
    date: DateTime(2024, 8, 15),
    value: 29.90,
  ),
];
