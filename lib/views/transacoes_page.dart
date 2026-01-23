import 'package:finceiro_app/components/transacoes/filtro_categorias.dart';
import 'package:finceiro_app/components/transacoes/transacoes_lista_filter.dart';
import 'package:finceiro_app/model/transacao_model.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/widgets/main_form.dart';
import 'package:flutter/material.dart';

class TransacoesPage extends StatefulWidget {
  const TransacoesPage({super.key});

  @override
  State<TransacoesPage> createState() => _TransacoesPageState();
}

class _TransacoesPageState extends State<TransacoesPage> {
  final TransacaoService _service = TransacaoService();
  List<TransacaoModel> transacoes = [];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final dados = _service.buscarTodas();
    setState(() {
      transacoes = dados.map((e) => TransacaoModel.fromMap(e)).toList();
    });
  }

  void _removerTransacao(int index) {
    setState(() {
      transacoes.removeAt(index);
    });
    _service.deletar(index);
    print('Transação removida com sucesso');
  }

  final TextEditingController _textController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Todas';

  List<TransacaoModel> get _transacoesFiltradas {
    return transacoes.where((t) {
      final matchesSearch = t.titulo.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          t.categoria.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Todas' ||
          t.categoria == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _transacoesFiltradas;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transações',
              style: AppTextStyles.text24Bold.copyWith(
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '${filteredList.length} transações registradas',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            MainSearchBar(
              keyboardType: TextInputType.text,
              controller: _textController,
              hint: 'Buscar...',
              prefixIcon: Icon(Icons.search, color: AppColors.primary),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            SizedBox(height: 20),
            ListaFiltro(
              onFilterChanged: (categoria) {
                setState(() {
                  _selectedCategory = categoria;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Resultados', style: AppTextStyles.text18),
            SizedBox(height: 10),
            TransacoesListaFilter(
              transacoes: filteredList,
              onRefresh: _carregarDados,
              onRemove: _removerTransacao,
            ),
          ],
        ),
      ),
    );
  }
}
