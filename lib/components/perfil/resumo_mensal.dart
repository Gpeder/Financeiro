import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ResumoMensal extends StatelessWidget {
  const ResumoMensal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Text('Resumo de Janeiro', style: AppTextStyles.text16),
          SizedBox(height: 10),
          ListTile(
            contentPadding: .zero,
            leading: Icon(
              Ionicons.trending_up,
              color: AppColors.chart3,
            ),
            title: Text(
              'Receita do mês',
              style: AppTextStyles.text18.copyWith(
                color: AppColors.foreground,
              ),
            ),
            trailing: Text(
              '\$5,000',
              style: AppTextStyles.text18Bold.copyWith(
                color: AppColors.chart3,
              ),
            ),
          ),
    
          SizedBox(height: 10),
          ListTile(
            contentPadding: .zero,
            leading: Icon(
              Ionicons.trending_down,
              color: AppColors.destructive,
            ),
            title: Text(
              'Despesa do mês',
              style: AppTextStyles.text18.copyWith(
                color: AppColors.foreground,
              ),
            ),
            trailing: Text(
              '\$5,000',
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
              style: AppTextStyles.text18.copyWith(
                color: AppColors.foreground,
              ),
            ),
            trailing: Text(
              '\$5,000',
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