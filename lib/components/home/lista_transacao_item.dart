import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

class ListaTrasacaoItem extends StatelessWidget {
  const ListaTrasacaoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Últimas transações', style: AppTextStyles.text18),
        SizedBox(height: 10),
    
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return TransacaoItem(
              title: 'Salário',
              description: 'Descrição da transação',
              date:
                  '01/01/2024',
              value: '1000.00',
              icon: '💼',
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ],
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
      padding: .symmetric(horizontal: 16, vertical: 8),
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