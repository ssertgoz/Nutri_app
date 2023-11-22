// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:nutri_app/utils/navigation_utils.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/landing_background.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.5, 0.9],
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.2),
                    Colors.black
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.12),
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'My Nutri App',
                        style: TextStyle(
                            fontSize: height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'AI Powered Nutrition tracking App',
                        style: TextStyle(
                            fontSize: height * 0.0175, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: height * 0.05,
                                decoration: BoxDecoration(
                                    color: AppColors.themColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: height * 0.01,
                                decoration: BoxDecoration(
                                    color: AppColors.themColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: height * 0.01,
                                decoration: BoxDecoration(
                                    color: AppColors.themColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: height * 0.03,
                                vertical: height * 0.08),
                            width: double.infinity,
                            child: CustomButton(
                                text: "Get Started",
                                onPressed: () {
                                  context.go(RouteNames.signinOptionsScreen);
                                }))
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
