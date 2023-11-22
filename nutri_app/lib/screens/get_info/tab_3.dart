import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';

class Tab3 extends StatefulWidget {
  final Function onAnswered;
  const Tab3({Key? key, required this.onAnswered}) : super(key: key);

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  final List<List<String>> activeOptiosn = [
    ["Very Active", "I'm a workout fanatic"],
    ["Active", "I enjoy a nice walk in the afternoon"],
    ["Not active", "I perefer resting all week"]
  ];

  String choosenActive = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.only(top: height * 0.15),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Text(
                    "How active are you ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height * 0.027,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkThemeColor),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Choose one of these options",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                      activeOptiosn.length,
                      (index) => Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            width: double.infinity,
                            child: CustomButtonWithSubTitle(
                              text: activeOptiosn[index][0],
                              subText: activeOptiosn[index][1],
                              onPressed: () {
                                choosenActive = activeOptiosn[index][0];
                                widget.onAnswered();
                              },
                              backgroundColor:
                                  choosenActive == activeOptiosn[index][0]
                                      ? AppColors.choosenOptionGreenColor
                                      : Colors.white,
                              foregroundColor: Colors.black87,
                            ),
                          )),
                ),
              ],
            ))
      ],
    );
  }
}
