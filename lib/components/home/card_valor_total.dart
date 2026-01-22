import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardValorTotal extends StatelessWidget {
  const CardValorTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saldo total',
                  style: AppTextStyles.text16.copyWith(
                    color: AppColors.background,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Ionicons.eye_outline),
                  color: AppColors.background,
                  iconSize: 24,
                ),
              ],
            ),
            Text(
              'R\$ 12.345,67',
              style: AppTextStyles.text30Bold.copyWith(
                color: AppColors.background,
              ),
            ),
            Text(
              'Janeiro 2026',
              style: AppTextStyles.text16.copyWith(
                color: AppColors.background.withValues(alpha: .6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}