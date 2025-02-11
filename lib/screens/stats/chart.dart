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

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 20, getTitlesWidget: getTiles,),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
      ),
    );
  }

  Widget getTiles(double value, TitleMeta meta){
    var style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch(value.toInt()){
      case 0:
        text = Text("01", style: style,);
        break;
      case 1:
        text = Text("02", style: style,);
        break;
      case 2:
        text = Text("03", style: style,);
        break;
      case 3:
        text = Text("04", style: style,);
        break;
      case 4:
        text = Text("05", style: style,);
        break;
      case 5:
        text = Text("06", style: style,);
        break;
      case 6:
        text = Text("07", style: style,);
        break;
      case 7:
        text = Text("08", style: style,);
        break;
      default:
        text = Text("", style: style,);
        break;
    }
    return text;
  }
}

