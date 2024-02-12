import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlowChart extends StatefulHookConsumerWidget {
  const FlowChart(
      {super.key,
      required this.color,
      required this.label,
      required this.values,
      required this.labels,
      this.backgroundColor,
      this.borderColor});
  final Color color;
  final Color? backgroundColor;
  final Color? borderColor;
  final String label;
  final List<int> values;
  final List<String> labels;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FlowChartState();
}

class _FlowChartState extends ConsumerState<FlowChart> {
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: widget.borderColor ?? widget.color.withOpacity(0.1)),
                  color: widget.backgroundColor ?? widget.color.withOpacity(0.04)),
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: LineChart(LineChartData(
                clipData: const FlClipData.all(),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: widget.color.withOpacity(0.07),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: const FlTitlesData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: widget.values.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value.toDouble());
                    }).toList(),
                    isCurved: false,
                    color: widget.color,
                    barWidth: 1.4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    aboveBarData: BarAreaData(show: false),
                    belowBarData: BarAreaData(
                      show: false,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [widget.color.withOpacity(0.01), const Color(0xffffffff)]),
                    ),
                  ),
                ],
              )),
            ),
            Positioned(
              left: 12,
              top: 20,
              child: Text(
                widget.label,
                style: TextStyle(color: widget.color, fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            Positioned(
              right: 12,
              top: 18,
              child: SizedBox(
                height: constraints.maxHeight - 26,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: widget.labels.reversed
                      .map((e) => Text(e, style: const TextStyle(fontSize: 10, color: Color(0xFFA4A5A6))))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
