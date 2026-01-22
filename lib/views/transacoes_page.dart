import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/widgets/main_form.dart';
import 'package:flutter/material.dart';

class TransacoesPage extends StatelessWidget {
  const TransacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Transações',
              style: AppTextStyles.text24Bold.copyWith(
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '8 transações registradas',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            MainSearchBar(
              controller: TextEditingController(),
              hint: 'Buscar...',
              prefixIcon: Icon(Icons.search, color: AppColors.primary),
              onChanged: (_) {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
