import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  // String selectedChips = "Dec";

  // List<String> chips = [
  //   'Jan',
  //   'Feb',
  //   'Mar',
  //   'Apr',
  //   'May',
  //   'Jun',
  //   "Jul",
  //   // 'Aug',
  //   // 'Sep',
  //   // 'Oct',
  //   // 'Nov',
  //   // 'Dec',
  // ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none, // Remove the border color
      ),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                child: SfCartesianChart(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  borderWidth: 2,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: const CategoryAxis(
                    // isVisible: false,
                    majorGridLines: MajorGridLines(width: 0),
                    axisLine: AxisLine(width: 0),
                    labelStyle: TextStyle(
                        color: Color(0xFF0246A7), fontWeight: FontWeight.bold),
                  ),
                  primaryYAxis: const NumericAxis(
                    isVisible: false,
                    minimum: 0,
                    maximum: 2,
                    interval: 0.2,
                    majorGridLines: MajorGridLines(width: 0),
                    axisLine: AxisLine(width: 0),
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<ChartColumnData, String>(
                      dataSource: chartData,
                      width: 0.6,
                      borderRadius: BorderRadius.circular(20),
                      trackPadding: 2,
                      color: Color(0xFF0487E2),
                      xValueMapper: (ChartColumnData data, _) => data.x,
                      yValueMapper: (ChartColumnData data, _) => data.y,
                    ),
                    ColumnSeries<ChartColumnData, String>(
                      dataSource: chartData,
                      width: 0.6,
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF6AB2F2),
                      xValueMapper: (ChartColumnData data, _) => data.x,
                      yValueMapper: (ChartColumnData data, _) => data.y1,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 27,
                    height: 18,
                    decoration: BoxDecoration(
                        color: Color(0xFF0487E2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Income',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0246A7)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 27,
                    height: 18,
                    decoration: BoxDecoration(
                        color: Color(0xFF6AB2F2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Expense',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0246A7)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ChartColumnData {
  ChartColumnData(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData("Jan", 1.7, 1.1),
  ChartColumnData("Feb", 1.3, 0.8),
  ChartColumnData("Mar", 2, 1),
  ChartColumnData("Apr", 1.5, 1.7),
  ChartColumnData("May", 1.5, 0.5),
  ChartColumnData("Jun", 0.5, 0.7),
  ChartColumnData("Jul", 1.2, 0.9),
  ChartColumnData("Aug", 1.9, 1.5),
];


  // Row(
              //   children: [
              //     Expanded(
              //       flex: 4,
              //       child: Column(
              //         children: [
              //           Text(
              //             "Transaction Chart",
              //             style: GoogleFonts.firaSans(
              //               textStyle: const TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w400,
              //                   color: Colors.blueGrey),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 8),
              // FittedBox(
              //   child: Wrap(
              //     spacing: 4,
              //     children: chips.map((category) {
              //       return ChoiceChip(
              //         label: Text(
              //           category,
              //           style: GoogleFonts.firaSans(),
              //         ),
              //         labelStyle:
              //             const TextStyle(color: Colors.deepPurpleAccent),
              //         selectedColor: Colors.grey.shade200,
              //         backgroundColor: Colors.white,
              //         showCheckmark: false,
              //         selected: selectedChips.contains(category),
              //         side: const BorderSide(width: 0, color: Colors.white),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         checkmarkColor: Colors.deepPurpleAccent,
              //         onSelected: (isSelected) {
              //           setState(() {
              //             if (isSelected) {
              //               selectedChips = category;
              //             }
              //           });
              //         },
              //       );
              //     }).toList(),
              //   ),
              // ),
