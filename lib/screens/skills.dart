import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SkillsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeft(child: Text('Skills', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white))),
          SizedBox(height: 10),
          _buildSkillsChart(),
        ],
      ),
    );
  }

  Widget _buildSkillsChart() {
    return FadeInUp(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(top: 16.0, right: 8),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: 'Skills'),
              labelPosition: ChartDataLabelPosition.inside,
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Proficiency'),
              
            ),
            series: <BarSeries<ChartData, String>>[
              BarSeries<ChartData, String>(
                dataSource: [
                  ChartData('Java', 8),
                  ChartData('Dart', 9),
                  ChartData('Flutter', 7),
                  ChartData('MySQL', 8),
                  ChartData('Git', 9),
                  ChartData('Algorithms', 8),
                ],
                xValueMapper: (ChartData data, _) => data.skill,
                color: Colors.teal,
                yValueMapper: (ChartData data, _) => data.proficiency,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String skill;
  final int proficiency;

  ChartData(this.skill, this.proficiency);
}