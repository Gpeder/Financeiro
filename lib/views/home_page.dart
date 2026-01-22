import 'package:finceiro_app/components/home/card_receitas.dart';
import 'package:finceiro_app/components/home/card_valor_total.dart';
import 'package:finceiro_app/components/home/grafico_gastos.dart';
import 'package:finceiro_app/components/home/lista_transacao_item.dart';
import 'package:finceiro_app/components/home/modal_homepage.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
            ReceitaTotal(),
            SizedBox(height: 20),
            GraficoGastos(),
            SizedBox(height: 20),
            ListaTrasacaoItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (_) => const MainModal(),
          );
        },
        child: Icon(Ionicons.add, size: 28),
      ),
    );
  }
}
