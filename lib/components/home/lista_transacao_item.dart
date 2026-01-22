import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/model/transacao_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTrasacaoItem extends StatefulWidget {
  const ListaTrasacaoItem({super.key});

  @override
  State<ListaTrasacaoItem> createState() => _ListaTrasacaoItemState();
}

class _ListaTrasacaoItemState extends State<ListaTrasacaoItem> {
  final TransacaoService _service = TransacaoService();
  List<TransacaoModel> transacoes = [];

  @override
  void initState() {
    super.initState();
    carregarTransacoes();
  }

  void carregarTransacoes() {
    final dados = _service.buscarTodas();

    setState(() {
      transacoes = dados
          .map((e) => TransacaoModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    });

    print('📦 Transações carregadas: ${transacoes.length}');
  }

  String _getIcon(String? categoria) {
    switch ((categoria ?? '').toLowerCase()) {
      case 'salario mensal':
        return '💰';
      case 'alimentacao':
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

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transacoes.length,
          itemBuilder: (context, index) {
            final item = transacoes[index];
            return TransacaoItem(
              title: item.titulo ?? 'Sem título',
              description: item.description ?? 'Sem descrição',
              date: item.data != null
                  ? DateFormat('dd/MM/yyyy').format(item.data!)
                  : '',
              value: (item.valor ?? 0).toStringAsFixed(2),
              icon: _getIcon(item.categoria),
              isDespesa: item.isDespesa ?? true,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.zero,
        leading: Text(icon, style: AppTextStyles.text20),
        title: Text(title, style: AppTextStyles.text16Bold),
        subtitle: Text(
          '$description - $date',
          style: AppTextStyles.text14.copyWith(color: AppColors.foreground),
        ),
        trailing: Text(
          '${isDespesa ? "-" : "+"} R\$ $value',
          style: AppTextStyles.text16Bold.copyWith(
            color: isDespesa ? Colors.red : AppColors.chart3,
          ),
        ),
      ),
    );
  }
}
