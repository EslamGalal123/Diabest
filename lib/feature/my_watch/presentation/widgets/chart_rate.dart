// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LineChart extends StatefulWidget {
//   const LineChart({super.key});

//   @override
//   State<LineChart> createState() => _LineChartState();
// }

// class _LineChartState extends State<LineChart> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(aspectRatio: 1,
//     child: LineChart(LineChartData(LineChartData:[
// LineChartBarData(
//   spots:  [
//     FlSpot(0, 3),
//      FlSpot(2.6,2),
//       FlSpot(4.9,5),
//        FlSpot(5, 3),
//         FlSpot(2, 3),
//          FlSpot(7, 3),
//   ]
//   isCurved: true,
//   dotData: FlDotData(show: true),
//   color: Colors.blue,
//   barWidth: 5
// )

//     ]
//     maxX: 11,
//     minX: 0,
//     maxY: 5,
//     minY: 2,
//     backgroundColor: Colors.black,
//     titlesData: FlTitlesData(
//       show: true,
//       bottomTitles: AxisTitles(
//         axisNameWidget: Text("x axis"),
//         sideTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 30,
//           interval: 3
//         )
//       )
//     )
//     gridData: FlGridData(
//       show: true,
//       drawHorizontalLine: true,
      
//     )
//     )),);
//   }
// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.65,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots:const [
                FlSpot(0, 3),
                FlSpot(2.6, 3),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                
              ],
              isCurved: true,
              dotData:const FlDotData(show: false),
              color: Colors.black,
              barWidth: 2,
            ),
          ],
          // minX: 0,
          // maxX: 11,
          // minY: 2,
          // maxY: 5,
          backgroundColor:const Color(0xFFF9F5F5),
          titlesData:const FlTitlesData(
            show: false,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
              showTitles: false,
              reservedSize: 30,
              interval: 10,
//              getTitlesWidget: (value, titleMeta) {
//   switch (value.toInt()) {
//     case 0:
//       return Text('0');
//     case 3:
//       return Text('3');
//     case 6:
//       return Text('6');
//     case 9:
//       return Text('9');
//     case 11:
//       return Text('11');
//     default:
//       return Text('');
//   }
// },
            ),)
          ),
          gridData:const FlGridData(
            show: true,
            drawHorizontalLine: true,
          ),
          borderData: FlBorderData(border: Border.all(width: 0))
        ),
      ),
    );
  }
}