// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:nutri_app/screens/home_screen/line_chart.dart';
import 'package:nutri_app/screens/home_screen/pie_charts.dart';
import 'package:nutri_app/screens/home_screen/recipes_and_steps.dart';
import 'package:nutri_app/screens/home_screen/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String name = "";

  int selectedDayIndex = 27;
  int selectedTabIndex = 3;
  List<List> days = [];

  @override
  void initState() {
    super.initState();
    getPrevious28Days();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(selectedTabIndex);
  }

  void changeTabIndex() {
    _tabController.animateTo(selectedTabIndex);
    setState(() {});
  }

  List<List<dynamic>> getPrevious28Days() {
    // Bugünün tarihini alın
    DateTime now = DateTime.now();

    for (int i = 0; i < 28; i++) {
      // Günün tarihini oluşturun
      DateTime day = now.subtract(Duration(days: i));

      // Günün haftanın gününü alın
      List<String> dayNames = [
        "Su",
        "Mo",
        "Tu",
        "We",
        "Th",
        "Fr",
        "Sa",
      ];
      List<String> monthNames = [
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
        'January',
      ];
      String dayOfWeek = dayNames[day.weekday - 1];

      // Günün ayına ait bilgisini alın
      String month = monthNames[day.month - 1];

      // Günün yılını alın
      int year = day.year;
      int randomMonth1 = Random().nextInt(2000 - 500 + 1) + 500;
      int randomMonth2 = Random().nextInt(2000 - 500 + 1) + 500;
      // Günün bilgisini listeye ekleyin
      days.add([
        dayOfWeek.toString(),
        month.toString(),
        year.toString(),
        randomMonth1,
        randomMonth2
      ]);
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        color: AppColors.themColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.53,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: height * 0.2),
                      padding: EdgeInsets.only(
                          bottom: height * 0.01, top: height * 0.06),
                      height: height * 0.6,
                      color: AppColors.themColor2,
                    ),
                    Container(
                      height: height * 0.55,
                      alignment: Alignment.bottomCenter,
                      child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/appbar_home.png")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.06),
                      child: Column(
                        children: [
                          Welcome(),
                          Container(
                            width: double.infinity,
                            height: 1,
                            margin: EdgeInsets.only(
                              top: 20,
                              left: height * 0.03,
                              right: height * 0.03,
                            ),
                            color: Colors.white,
                          ),
                          Container(
                            height: height * 0.2,
                            padding: EdgeInsets.only(
                              left: height * 0.03,
                              right: height * 0.03,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/fire.png"),
                                          width: height * 0.05,
                                        ),
                                        Text(
                                          "Calories Burnt",
                                          style: TextStyle(
                                              fontSize: height * 0.013,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.lightThemColor),
                                        ),
                                        Text(
                                          days[selectedDayIndex][3].toString(),
                                          style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Kcal",
                                          style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: PieCharts(
                                        days: days,
                                        selectedDayIndex: selectedDayIndex)),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/fork.png"),
                                          width: height * 0.05,
                                        ),
                                        Text(
                                          "Food Intake",
                                          style: TextStyle(
                                              fontSize: height * 0.013,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.darkThemeColor),
                                        ),
                                        Text(
                                          days[selectedDayIndex][4].toString(),
                                          style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Kcal",
                                          style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              days[selectedDayIndex][1] +
                                  " " +
                                  days[selectedDayIndex][2],
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          getDays(height)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RecipesAndSteps(),
              Container(
                height: height * 0.25,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: height * 0.045),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust opacity here
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(10, 10),
                        ),
                      ]),
                  child: LineChartSample2(
                    data: days,
                  ),
                ),
              ),
              SizedBox(
                height: 400,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getDays(double height) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: SizedBox(
        height: height * 0.06,
        width: double.infinity,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  if (selectedTabIndex != 0) {
                    selectedTabIndex -= 1;
                    changeTabIndex();
                  }
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: height * 0.04,
                )),
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              child: TabBarView(
                controller: _tabController,
                children: List.generate(
                    4,
                    (index1) => Row(
                          children: List.generate(
                              7,
                              (int index2) => Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedDayIndex =
                                              (((index1 + 1) * 7 - 7) + index2);
                                        });
                                      },
                                      child: Container(
                                        color: selectedDayIndex ==
                                                (((index1 + 1) * 7 - 7) +
                                                    index2)
                                            ? Colors.white
                                            : AppColors.lightThemColor
                                                .withOpacity(0.5),
                                        child: Center(
                                          child: Text(
                                            getPrevious28Days()[
                                                (((index1 + 1) * 7 - 7) +
                                                    index2)][0],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColors.darkThemeColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        )),
              ),
            )),
            IconButton(
                onPressed: () {
                  if (selectedTabIndex != 3) {
                    selectedTabIndex += 1;
                    changeTabIndex();
                  }
                },
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  size: height * 0.04,
                ))
          ],
        ),
      ),
    );
  }
}
