import 'package:finceiro_app/helper/format.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardReceitas extends StatelessWidget {
  final String titulo;
  final IconData icon;
  final Color iconBgColor;
  final String valor;
  const CardReceitas({
    super.key,
    required this.titulo,
    required this.icon,
    required this.iconBgColor,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        horizontalTitleGap: 10,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconBgColor,
          ),
          child: Icon(icon, size: 16, color: AppColors.background),
        ),
        title: Text(titulo, style: AppTextStyles.text18),
        subtitle: Text(
          valor,
          style: AppTextStyles.text20Bold.copyWith(color: iconBgColor),
        ),
      ),
    );
  }
}

class ReceitaTotal extends StatefulWidget {
  final bool isVisivel;

  const ReceitaTotal({super.key, required this.isVisivel});

  @override
  State<ReceitaTotal> createState() => ReceitaTotalState();
}

class ReceitaTotalState extends State<ReceitaTotal> {
  final TransacaoService _service = TransacaoService();
  double totalReceitas = 0;
  double totalDespesas = 0;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    final transacoes = _service.buscarTodas();
    final agora = DateTime.now();

    double receitas = 0;
    double despesas = 0;

    for (var t in transacoes) {
      final data = t['data'];
      if (data is DateTime && data.month == agora.month && data.year == agora.year) {
        final valor = (t['valor'] ?? 0).toDouble();
        if (t['isDespesa'] == true) {
          despesas += valor;
        } else {
          receitas += valor;
        }
      }
    }

    setState(() {
      totalReceitas = receitas;
      totalDespesas = despesas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CardReceitas(
            titulo: 'Receita',
            icon: Ionicons.trending_up,
            iconBgColor: AppColors.chart3,
            valor: widget.isVisivel
                ? 'R\$ ${Formatador.moedabr(totalReceitas)}'
                : 'R\$ *****',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CardReceitas(
            titulo: 'Despesas',
            icon: Ionicons.trending_down,
            iconBgColor: AppColors.destructive,
            valor: widget.isVisivel
                ? 'R\$ ${Formatador.moedabr(totalDespesas)}'
                : 'R\$ *****',
          ),
        ),
      ],
    );
  }
}