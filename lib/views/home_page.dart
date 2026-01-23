import 'package:finceiro_app/components/home/card_receitas.dart';
import 'package:finceiro_app/components/home/card_valor_total.dart';
import 'package:finceiro_app/components/home/grafico_gastos.dart';
import 'package:finceiro_app/components/home/lista_transacao_item.dart';
import 'package:finceiro_app/components/home/modal_homepage.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ListaTrasacaoItemState> _listaKey = GlobalKey();
  final GlobalKey<GraficoGastosState> _graficoKey = GlobalKey();
  final GlobalKey<ReceitaTotalState> _receitaKey = GlobalKey();
  final GlobalKey<CardValorTotalState> _saldoKey = GlobalKey();

  Future<void> _atualizarTudo() async {
    _listaKey.currentState?.carregarDados();
    _graficoKey.currentState?.carregarDados();
    _receitaKey.currentState?.carregarDados();
    _saldoKey.currentState?.carregarDados();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> _abrirModal() async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (_) => const MainModal(),
    );

    if (result == true) {
      _atualizarTudo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
      body: RefreshIndicator(
        onRefresh: _atualizarTudo,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
          children: [
            CardValorTotal(key: _saldoKey),
            SizedBox(height: 20),
            ReceitaTotal(key: _receitaKey),
            SizedBox(height: 20),
            GraficoGastos(key: _graficoKey),
            SizedBox(height: 20),
            ListaTrasacaoItem(key: _listaKey),
          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: _abrirModal,
        child: Icon(Ionicons.add, size: 28),
      ),
    );
  }
}
