import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoGastos extends StatelessWidget {
  const GraficoGastos({
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
        mainAxisSize: .min,
        children: [
          Text('Gastos do categoria', style: AppTextStyles.text20Bold),
          SizedBox(height: 20),
    
          SizedBox(
            height: 200,
            child: SfCircularChart(
              margin: .zero,
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
                  widget: Text(
                    'Total',
                    style: AppTextStyles.text18Bold,
                  ),
                ),
              ],
    
              series: <CircularSeries>[
                DoughnutSeries<Map<String, dynamic>, String>(
                  dataSource: [
                    {
                      'categoria': 'Moradia',
                      'valor': 1500,
                      'cor': AppColors.chart1,
                    },
                    {
                      'categoria': 'Alimentação',
                      'valor': 1000,
                      'cor': AppColors.chart2,
                    },
                    {
                      'categoria': 'Saude',
                      'valor': 500,
                      'cor': AppColors.chart3,
                    },
                    {
                      'categoria': 'Lazer',
                      'valor': 800,
                      'cor': AppColors.chart4,
                    },
                    {
                      'categoria': 'Outros',
                      'valor': 700,
                      'cor': AppColors.chart5,
                    },
                  ],
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