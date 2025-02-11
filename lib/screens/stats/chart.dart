import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget{
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [BarChartRodData(
        toY: y,
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 45)
          ),
        width: 10,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 5,
          color: Colors.grey.shade200
        )
      ),],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
    switch(i){
      case 0:
        return makeGroupData(0, 2);
      case 1:
        return makeGroupData(1, 3);
      case 2:
        return makeGroupData(2, 2);
      case 3:
        return makeGroupData(3, 4.5);
      case 4:
        return makeGroupData(4, 3.8);
      case 5:
        return makeGroupData(5, 1.5);
      case 6:
        return makeGroupData(6, 4);
      case 7:
        return makeGroupData(7, 3.8);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    // List<BarChartGroupData> barGroups = [];
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        bottomTitles:AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 20, getTitlesWidget: getTiles,),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 20, getTitlesWidget: leftTiles,),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false)
    );
  }

  Widget getTiles(double value, TitleMeta meta){
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String text;
    switch(value.toInt()){
      case 0:
        text = "01";
        break;
      case 1:
        text = "02";
        break;
      case 2:
        text = "03";
        break;
      case 3:
        text = "04";
        break;
      case 4:
        text = "05";
        break;
      case 5:
        text = "06";
        break;
      case 6:
        text = "07";
        break;
      case 7:
        text = "08";
        break;
      default:
        text = "";
        break;
    }
    return SideTitleWidget(
        meta: meta,
        space: 0,
        child: Text(text, style: style,)
    );
  }

  Widget leftTiles(double value, TitleMeta meta)
  {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;

    if(value == 0)
    {
      text = "0";
    }
    else if(value == 1)
    {
      text = "₹ 1k";
    }
    else if(value == 2)
    {
      text = "₹ 2k";
    }
    else if(value == 3)
    {
      text = "₹ 3k";
    }
    else if(value == 4)
    {
      text = "₹ 4k";
    }
    else if(value == 5)
    {
      text = "₹ 5k";
    }
    else
    {
      return Container();
    }

    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style,)
    );
  }
}

