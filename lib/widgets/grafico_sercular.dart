// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:negocios_col_panel/utils/colors.dart';

class ItemGraficoCircular {
  final String label;
  final double value;

  ItemGraficoCircular({
    required this.label,
    required this.value,
  });
}

class GraficoCircular extends StatefulWidget {
  final List<ItemGraficoCircular> data;
  const GraficoCircular({
    super.key,
    required this.data,
  });

  @override
  State<GraficoCircular> createState() => _GraficoCircularState();
}

class _GraficoCircularState extends State<GraficoCircular> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                startDegreeOffset: 15,
                sections: showingSections(),
              ),
            ),
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: showingLabels()),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    double total = 0.0;
    for (final item in widget.data) {
      total += item.value;
    }

    List<PieChartSectionData> data = [];
    int countColor = 0;

    for (var i = 0; i < widget.data.length; i++) {
      final item = widget.data[i];

      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final porsentaje = (item.value / total) * 100;

      data.add(PieChartSectionData(
        color: colorsCharts[i],
        value: porsentaje,
        title: '${porsentaje.toStringAsFixed(2)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      ));
    }
    return data;
  }

  List<Widget> showingLabels() {
    List<Widget> data = [];
    int countColor = 0;

    for (var i = 0; i < widget.data.length; i++) {
      final item = widget.data[i];
      0;

      data.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(item.label),
            const SizedBox(width: 10.0),
            Text(item.value.toString()),
            const SizedBox(width: 10.0),
            CircleAvatar(
              maxRadius: 5,
              backgroundColor: colorsCharts[i],
            )
          ],
        ),
      );
    }
    return data;
  }
}
