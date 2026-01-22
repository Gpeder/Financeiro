import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DadosUsuario extends StatelessWidget {
  const DadosUsuario({
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
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/user_avatar.png'),
        ),
        title: Text(
          'Nome do Usuário',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.text20Bold.copyWith(
            color: AppColors.foreground,
          ),
        ),
        subtitle: Text(
          'email@exemplo.com',
          style: AppTextStyles.text16.copyWith(
            color: AppColors.foreground,
          ),
        ),
        trailing: Icon(
          Ionicons.create_outline,
          color: AppColors.primary,
        ),
      ),
    );
  }
}