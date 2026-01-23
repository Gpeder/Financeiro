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

  @override
  Widget build(BuildContext context) {
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
              '${transacoes.length} transações registradas',
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
              controller: TextEditingController(),
              hint: 'Buscar...',
              prefixIcon: Icon(Icons.search, color: AppColors.primary),
              onChanged: (_) {},
            ),
            SizedBox(height: 20),
            ListaFiltro(),
            SizedBox(height: 20),
            Text('Resultados', style: AppTextStyles.text18),
            SizedBox(height: 10),
            TransacoesListaFilter(
              transacoes: transacoes,
              onRefresh: _carregarDados,
              onRemove: _removerTransacao,
            ),
          ],
        ),
      ),
    );
  }
}

