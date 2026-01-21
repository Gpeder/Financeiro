import 'package:finceiro_app/components/home/card_receitas.dart';
import 'package:finceiro_app/components/home/card_valor_total.dart';
import 'package:finceiro_app/components/home/grafico_gastos.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Olá 👋',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
            SizedBox(height: 4),
            Text(
              'Seu resumo financeiro',
              style: AppTextStyles.text24Bold.copyWith(
                color: AppColors.foreground,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            CardValorTotal(),
            SizedBox(height: 20),
            ReceitaTotal(),
            SizedBox(height: 20),
            GraficoGastos(),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('Últimas transações', style: AppTextStyles.text18),
                SizedBox(height: 10),
                TransacaoItem(
                  icon: '🍕',
                  title: 'Pizza',
                  value: 'R\$ 12,45',
                  date: '12/02/2023',
                  description: 'Restaurante',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransacaoItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? date;
  final String? value;
  final String icon;

  const TransacaoItem({
    super.key,
    this.title,
    this.value,
    required this.icon,
    this.description,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        onTap: () {},
        contentPadding: .zero,
        leading: Text(icon, style: AppTextStyles.text20),
        title: Text(title ?? 'Receita', style: AppTextStyles.text16Bold),
        subtitle: Text(
          '$description - $date',
          style: AppTextStyles.text14.copyWith(color: AppColors.foreground),
        ),
        trailing: Text(
          '+ R\$ $value',
          style: AppTextStyles.text16Bold.copyWith(color: AppColors.chart3),
        ),
      ),
    );
  }
}
