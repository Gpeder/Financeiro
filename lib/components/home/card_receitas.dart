import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

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