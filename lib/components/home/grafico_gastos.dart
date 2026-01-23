import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoGastos extends StatefulWidget {
  const GraficoGastos({super.key});

  @override
  State<GraficoGastos> createState() => GraficoGastosState();
}

class GraficoGastosState extends State<GraficoGastos> {
  final TransacaoService _service = TransacaoService();
  List<Map<String, dynamic>> gastosPorCategoria = [];
  double totalGastos = 0;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    final transacoes = _service.buscarTodas();

    final despesas = transacoes.where((t) => t['isDespesa'] == true).toList();

    Map<String, double> categoriasMap = {};
    for (var despesa in despesas) {
      String categoria = despesa['categoria'] ?? 'Outros';
      double valor = (despesa['valor'] ?? 0).toDouble();
      categoriasMap[categoria] = (categoriasMap[categoria] ?? 0) + valor;
    }

    final cores = [
      AppColors.chart1,
      AppColors.chart2,
      AppColors.chart3,
      AppColors.chart4,
      AppColors.chart5,
    ];

    int index = 0;
    List<Map<String, dynamic>> resultado = [];
    double total = 0;

    categoriasMap.forEach((categoria, valor) {
      resultado.add({
        'categoria': categoria,
        'valor': valor,
        'cor': cores[index % cores.length],
      });
      total += valor;
      index++;
    });

    setState(() {
      gastosPorCategoria = resultado;
      totalGastos = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Gastos por categoria', style: AppTextStyles.text20Bold),
          SizedBox(height: 20),

          if (gastosPorCategoria.isEmpty)
            SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'Nenhuma despesa registrada',
                  style: AppTextStyles.text14.copyWith(
                    color: AppColors.onMuted,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 200,
              child: SfCircularChart(
                margin: EdgeInsets.zero,
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  alignment: ChartAlignment.center,
                  position: LegendPosition.right,
                  iconHeight: 20,
                  iconWidth: 20,
                  itemPadding: 10,
                  textStyle: AppTextStyles.text14,
                ),

                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Total', style: AppTextStyles.text14),
                        Text(
                          'R\$ ${totalGastos.toStringAsFixed(0)}',
                          style: AppTextStyles.text18Bold,
                        ),
                      ],
                    ),
                  ),
                ],

                series: <CircularSeries>[
                  DoughnutSeries<Map<String, dynamic>, String>(
                    dataSource: gastosPorCategoria,
                    xValueMapper: (Map<String, dynamic> data, _) =>
                        data['categoria'],
                    yValueMapper: (Map<String, dynamic> data, _) =>
                        data['valor'],
                    pointColorMapper: (Map<String, dynamic> data, _) =>
                        data['cor'],

                    innerRadius: '70%',
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: false,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
