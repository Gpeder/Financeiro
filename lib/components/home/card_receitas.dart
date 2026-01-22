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
        contentPadding: .symmetric(horizontal: 10, vertical: 12),
        leading: Container(
          padding: .symmetric(horizontal: 8, vertical: 8),
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

class ReceitaTotal extends StatelessWidget {
  const ReceitaTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CardReceitas(
            titulo: 'Receita',
            icon: Ionicons.trending_up,
            iconBgColor: AppColors.chart3,
            valor: '\$5,000.00',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CardReceitas(
            titulo: 'Despesas',
            icon: Ionicons.trending_down,
            iconBgColor: AppColors.destructive,
            valor: '\$5,000.00',
          ),
        ),
      ],
    );
  }
}