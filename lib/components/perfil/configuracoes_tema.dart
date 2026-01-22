import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/widgets/main_switch.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ConfiguracoesTema extends StatelessWidget {
  const ConfiguracoesTema({
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
          Text('Configurações', style: AppTextStyles.text16),
          SizedBox(height: 10),
          ListTile(
            contentPadding: .zero,
            leading: Icon(Ionicons.moon_outline, color: AppColors.primary),
            title: Text(
              'Tema escuro',
              style: AppTextStyles.text18.copyWith(
                color: AppColors.foreground,
              ),
            ),
            trailing: MainSwitch(
              value: true,
              onChanged: (bool newValue) {},
            ),
          ),
        ],
      ),
    );
  }
}