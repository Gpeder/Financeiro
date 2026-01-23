import 'package:finceiro_app/components/transacoes/filtro_categorias.dart';
import 'package:finceiro_app/model/transacao_model.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/widgets/main_alert.dart';
import 'package:finceiro_app/widgets/main_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

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

  void _carregarDados() {
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

  String _getIcon(String? categoria) {
    switch ((categoria ?? '').toLowerCase()) {
      case 'salario mensal':
        return '💰';
      case 'alimentação':
        return '🍔';
      case 'transporte':
        return '🚗';
      case 'lazer':
        return '🎮';
      case 'saúde':
        return '💊';
      case 'investimento':
        return '💸';
      case 'educação':
        return '📖';
      case 'moradia':
        return '🏠';
      default:
        return '📦';
    }
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
            Expanded(
              child: transacoes.isEmpty
                  ? Column(
                      children: [
                        Center(child: Text('Nenhuma transação encontrada.')),
                        SizedBox(height: 20),
                        Text(
                          'Atualize para ver as transações',
                          style: AppTextStyles.text14,
                        ),
                        SizedBox(height: 20),
                        IconButton(
                          onPressed: () => _carregarDados(),
                          icon: Icon(Ionicons.sync, color: AppColors.primary),
                        ),
                      ],
                    )
                  : ListView.separated(
                      itemCount: transacoes.length,
                      itemBuilder: (context, index) {
                        final item = transacoes[index];
                        return DismissibleTransacaoItem(
                          onConfirmDelete: () => _removerTransacao(index),
                          title: item.titulo,
                          description: item.categoria,
                          date: DateFormat('dd/MM/yyyy').format(item.data),
                          value: item.valor.toStringAsFixed(2),
                          icon: _getIcon(item.categoria),
                          isDespesa: item.isDespesa,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DismissibleTransacaoItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String value;
  final String icon;
  final bool isDespesa;
  final VoidCallback onConfirmDelete;

  const DismissibleTransacaoItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.value,
    required this.icon,
    required this.isDespesa,
    required this.onConfirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => showDeleteDialog(
        context: context,
        text: 'Excluir transação',
        description: 'Tem certeza que deseja excluir essa transação?',
        textButtonConfirm: 'Excluir',
        textButtonCancel: 'Cancelar',
      ),
      onDismissed: (_) => onConfirmDelete(),
      background: Container(
        padding: const EdgeInsets.only(right: 16),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.destructive,
        ),
        child: Icon(Ionicons.trash, color: AppColors.foreground),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Text(icon, style: AppTextStyles.text20),
          title: Text(title, style: AppTextStyles.text16Bold),
          subtitle: Text(
            '$description - $date',
            style: AppTextStyles.text14.copyWith(color: AppColors.onMuted),
          ),
          trailing: Text(
            '${isDespesa ? "-" : "+"} R\$ $value',
            style: AppTextStyles.text16Bold.copyWith(
              color: isDespesa ? Colors.red : AppColors.chart3,
            ),
          ),
        ),
      ),
    );
  }
}
