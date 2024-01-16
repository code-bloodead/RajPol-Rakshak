import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class BarChartConstants {
  BarChartConstants(int showingTooltip, List<BarData> dataList) {
    this.showingTooltip = showingTooltip;
    this.dataList = dataList;
  }

  static final shadowColor = const Color(0xFFCCCCCC);
  int showingTooltip = -1;
  List<BarData> dataList = [];

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}

class BarData {
  const BarData(this.color, this.value, this.shadowValue);
  final Color color;
  final double value;
  final double shadowValue;
}
