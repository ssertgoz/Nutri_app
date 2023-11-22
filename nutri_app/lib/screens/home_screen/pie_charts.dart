import 'package:flutter/material.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class PieCharts extends StatefulWidget {
  final days;
  final selectedDayIndex;
  const PieCharts(
      {Key? key, required this.days, required this.selectedDayIndex})
      : super(key: key);

  @override
  State<PieCharts> createState() => _PieChartsState();
}

class _PieChartsState extends State<PieCharts> {
  Map<String, double> dataMapCaloriesBurnt = {"Flutter": 5, "empty": 5};
  Map<String, double> dataMapFoodIntake = {"Flutter": 5, "empty": 5};
  @override
  Widget build(BuildContext context) {
    dataMapCaloriesBurnt = {
      "Flutter": widget.days[widget.selectedDayIndex][3].toDouble(),
      "empty":
          (3000 - widget.days[widget.selectedDayIndex][3].toDouble()).toDouble()
    };
    dataMapFoodIntake = {
      "Flutter": widget.days[widget.selectedDayIndex][4].toDouble(),
      "empty":
          (3000 - widget.days[widget.selectedDayIndex][4].toDouble()).toDouble()
    };
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Stack(alignment: Alignment.center, children: [
        PieChart(
          dataMap: dataMapCaloriesBurnt,
          animationDuration: Duration(milliseconds: 800),

          chartRadius: height / 3,
          colorList: const [
            AppColors.lightThemColor,
            AppColors.themColor2,
          ],
          initialAngleInDegree: 90,
          chartType: ChartType.ring,
          ringStrokeWidth: 20,
          totalValue: 3000,
          legendOptions: LegendOptions(
            showLegends: false,
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValues: false,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ),
        PieChart(
          dataMap: dataMapFoodIntake,
          animationDuration: Duration(milliseconds: 800),
          chartRadius: height / 10,
          colorList: const [
            AppColors.darkThemeColor,
            AppColors.themColor2,
          ],
          initialAngleInDegree: 90,
          chartType: ChartType.ring,
          ringStrokeWidth: 20,
          totalValue: 3000,
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: false,
          ),
          centerTextStyle:
              const TextStyle(color: AppColors.darkThemeColor, fontSize: 10),
          centerWidget: Stack(alignment: Alignment.center, children: [
            Container(
              height: height / 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.5), // Adjust opacity here
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]),
            ),
            Text(
              (widget.days[widget.selectedDayIndex][3] +
                      widget.days[widget.selectedDayIndex][4])
                  .toString(),
              style: TextStyle(
                  color: AppColors.darkThemeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.02),
            )
          ]),
        )
      ]),
    );
  }
}
