import 'package:auto_size_text/auto_size_text.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/model/transacao_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTrasacaoItem extends StatefulWidget {
  const ListaTrasacaoItem({super.key});

  @override
  State<ListaTrasacaoItem> createState() => ListaTrasacaoItemState();
}

class ListaTrasacaoItemState extends State<ListaTrasacaoItem> {
  final TransacaoService _service = TransacaoService();
  List<TransacaoModel> transacoes = [];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    final dados = _service.buscarTodas();
    final agora = DateTime.now();

    setState(() {
      transacoes =
          dados
              .map((e) => TransacaoModel.fromMap(e))
              .where(
                (t) => t.data.month == agora.month && t.data.year == agora.year,
              )
              .toList()
            ..sort((a, b) => b.data.compareTo(a.data));

      if (transacoes.length > 10) {
        transacoes = transacoes.sublist(0, 10);
      }
    });
  }

  String _getIcon(String? categoria) {
    switch ((categoria ?? '').toLowerCase()) {
      case 'salário':
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Últimas transações', style: AppTextStyles.text18),
        const SizedBox(height: 10),

        if (transacoes.isEmpty)
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Nenhuma transação encontrada.'),
          ),

        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 20),
          shrinkWrap: true,
          itemCount: transacoes.length,
          itemBuilder: (context, index) {
            final item = transacoes[index];
            return TransacaoItem(
              title: item.titulo,
              description: item.categoria,
              date: DateFormat('dd/MM/yyyy').format(item.data),
              value: item.valor.toStringAsFixed(2),
              icon: _getIcon(item.categoria),
              isDespesa: item.isDespesa,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ],
    );
  }
}

class TransacaoItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String value;
  final String icon;
  final bool isDespesa;

  const TransacaoItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.value,
    required this.icon,
    required this.isDespesa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        trailing: AutoSizeText(
          maxLines: 1,
          minFontSize: 12,
          '${isDespesa ? "-" : "+"} R\$ $value',
          style: AppTextStyles.text16Bold.copyWith(
            color: isDespesa ? Colors.red : AppColors.chart3,
          ),
        ),
      ),
    );
  }
}
