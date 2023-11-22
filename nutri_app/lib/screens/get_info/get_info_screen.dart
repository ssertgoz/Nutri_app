// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:nutri_app/screens/get_info/tab_1.dart';
import 'package:nutri_app/screens/get_info/tab_2.dart';
import 'package:nutri_app/screens/get_info/tab_3.dart';
import 'package:nutri_app/screens/get_info/tab_4.dart';
import 'package:nutri_app/screens/get_info/tab_5.dart';
import 'package:nutri_app/screens/get_info/tab_6.dart';
import 'package:nutri_app/utils/navigation_utils.dart';

class GetInfoScreen extends StatefulWidget {
  const GetInfoScreen({Key? key}) : super(key: key);

  @override
  State<GetInfoScreen> createState() => _GetInfoScreenState();
}

class _GetInfoScreenState extends State<GetInfoScreen>
    with SingleTickerProviderStateMixin {
  final _ageController = TextEditingController();

  late TabController _tabController;

  bool isAnswered = false;
  int currentIndex = 0;

  List<String> textsForTabBar = [
    "Let's get to know you !",
    "Tell us more details about yourself",
    "Tell us about your activitiy level",
    "Tell us about your goals ",
    "Few more extras",
    "Tell us about your food preferences",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  void changeTabIndex() {
    _tabController.animateTo(currentIndex);
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: AppColors.themColor,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.01),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: height,
                      padding: EdgeInsets.symmetric(
                        horizontal: height * 0.03,
                      ),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Tab1(onAnswered: () {
                            isAnswered = true;
                            setState(() {});
                          }),
                          Tab2(onAnswered: () {
                            isAnswered = true;
                            setState(() {});
                          }),
                          Tab3(onAnswered: () {
                            isAnswered = true;
                            setState(() {});
                          }),
                          Tab4(onAnswered: () {
                            isAnswered = true;
                            setState(() {});
                          }),
                          Tab5(onAnswered: () {
                            isAnswered = true;
                            setState(() {});
                          }),
                          Tab6(onAnswered: () {
                            isAnswered = true;
                            setState(() {});
                          }),
                        ],
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                        bottom: height * 0.05,
                        top: height * 0.02),
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () {
                        if (currentIndex == 5) {
                          context.go(RouteNames.homeScreen);
                        } else if (isAnswered) {
                          isAnswered = false;
                          currentIndex += 1;
                          changeTabIndex();
                        }
                      },
                      text: "Next",
                      status: isAnswered
                          ? CustomButtonStatus.dark
                          : CustomButtonStatus.disabled,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: height * 0.25,
                width: double.infinity,
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.centerLeft,
                    children: [
                      Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/appbar.png")),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                6,
                                (index) => Expanded(
                                  child: Container(
                                    height: height * 0.012,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: index <= currentIndex
                                            ? AppColors.darkThemeColor
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: double.infinity,
                              child: Text(
                                textsForTabBar[currentIndex],
                                style: TextStyle(
                                    fontSize: height * 0.015,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
