import 'package:finceiro_app/helper/format.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardValorTotal extends StatefulWidget {
  const CardValorTotal({super.key});

  @override
  State<CardValorTotal> createState() => CardValorTotalState();
}

class CardValorTotalState extends State<CardValorTotal> {
  final TransacaoService _service = TransacaoService();
  bool _isVisivel = true;
  double saldoTotal = 0;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    final transacoes = _service.buscarTodas();

    double total = 0;
    for (var t in transacoes) {
      final valor = (t['valor'] ?? 0).toDouble();
      if (t['isDespesa'] == true) {
        total -= valor;
      } else {
        total += valor;
      }
    }

    setState(() {
      saldoTotal = total;
    });
  }

  String _getMesAbreviado(int mes) {
    const meses = [
      'jan', 'fev', 'mar', 'abr', 'mai', 'jun',
      'jul', 'ago', 'set', 'out', 'nov', 'dez'
    ];
    return meses[mes - 1];
  }

  @override
  Widget build(BuildContext context) {
    final agora = DateTime.now();
    final mesAno = '${_getMesAbreviado(agora.month)} ${agora.year}';

    return Card(
      elevation: 1,
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  onPressed: () {
                    setState(() {
                      _isVisivel = !_isVisivel;
                    });
                  },
                  icon: _isVisivel
                      ? Icon(Ionicons.eye_outline)
                      : Icon(Ionicons.eye_off_outline),
                  color: AppColors.background,
                  iconSize: 24,
                ),
              ],
            ),
            Text(
              _isVisivel ? 'R\$ ${Formatador.moedabr(saldoTotal)}' : 'R\$ *****',
              style: AppTextStyles.text30Bold.copyWith(
                color: AppColors.background,
              ),
            ),
            Text(
              mesAno,
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
