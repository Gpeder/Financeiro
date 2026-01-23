import 'package:finceiro_app/helper/format.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ResumoMensal extends StatefulWidget {
  const ResumoMensal({super.key});

  @override
  State<ResumoMensal> createState() => ResumoMensalState();
}

class ResumoMensalState extends State<ResumoMensal> {
  final TransacaoService _service = TransacaoService();
  double saldoTotal = 0;
  double receitas = 0;
  double despesas = 0;
  final agora = DateTime.now();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    final transacoes = _service.buscarTodas();

    double total = 0;
    for (var t in transacoes) {
      final valor = (t['valor'] ?? 0).toDouble();
      if (t['isDespesa'] == true) {
        total -= valor;
      } else {
        total += valor;
      }
    }

    for (var t in transacoes) {
      final data = t['data'];
      if (data is DateTime &&
          data.month == agora.month &&
          data.year == agora.year) {
        final valor = (t['valor'] ?? 0).toDouble();
        if (t['isDespesa'] == true) {
          despesas += valor;
        } else {
          receitas += valor;
        }
      }
    }

    setState(() {
      saldoTotal = total;
      receitas = receitas;
      despesas = despesas;
    });
  }

  String _getMesAbreviado(int mes) {
    const meses = [
      'jan',
      'fev',
      'mar',
      'abr',
      'mai',
      'jun',
      'jul',
      'ago',
      'set',
      'out',
      'nov',
      'dez',
    ];
    return meses[mes - 1];
  }

  @override
  Widget build(BuildContext context) {
    final agora = DateTime.now();
    final mesAno = '${_getMesAbreviado(agora.month)} ${agora.year}';
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [ 
          Text(
            'Resumo de $mesAno',
            style: AppTextStyles.text16,
          ),
          SizedBox(height: 10),
          ListTile(
            contentPadding: .zero,
            leading: Icon(Ionicons.trending_up, color: AppColors.chart3),
            title: Text(
              'Receita do mês',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
            trailing: Text(
              'R\$ ${Formatador.moedabr(receitas)}',
              style: AppTextStyles.text18Bold.copyWith(color: AppColors.chart3),
            ),
          ),

          SizedBox(height: 10),
          ListTile(
            contentPadding: .zero,
            leading: Icon(Ionicons.trending_down, color: AppColors.destructive),
            title: Text(
              'Despesa do mês',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
            trailing: Text(
              'R\$ ${Formatador.moedabr(despesas)}',
              style: AppTextStyles.text18Bold.copyWith(
                color: AppColors.destructive,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            contentPadding: .zero,
            leading: Icon(Ionicons.cash, color: AppColors.primary),
            title: Text(
              'Saldo atual',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
            trailing: Text(
              'R\$ ${Formatador.moedabr(saldoTotal)}',
              style: AppTextStyles.text18Bold.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
