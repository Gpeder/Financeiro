import 'package:finceiro_app/components/home/card_valor_total.dart';
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
            Row(
              children: [
                Expanded(
                  child: CardReceitas(
                    titulo: 'Receitas',
                    icon: Icons.arrow_upward,
                    iconBgColor: AppColors.chart3,
                    valor: '\$5,000.00',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CardReceitas(
                    titulo: 'Despesas',
                    icon: Icons.arrow_downward,
                    iconBgColor: AppColors.destructive,
                    valor: '\$5,000.00',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
        contentPadding: .symmetric(horizontal: 10, vertical: 12),
        leading: Container(
          padding: .symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconBgColor,
          ),
          child: Icon(icon, size: 16, color: AppColors.background),
        ),
        title: Text(titulo, style: AppTextStyles.text20),
        subtitle: Text(
          valor,
          style: AppTextStyles.text20Bold.copyWith(color: iconBgColor),
        ),
      ),
    );
  }
}
