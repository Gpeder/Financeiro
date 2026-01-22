import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Perfil',
              style: AppTextStyles.text24Bold.copyWith(
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Gerencie suas informações pessoais',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(children: [
            
          ],
        ),
      ),
    );
  }
}
