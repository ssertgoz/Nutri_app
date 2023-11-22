import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';

class Tab5 extends StatefulWidget {
  final Function onAnswered;
  const Tab5({Key? key, required this.onAnswered}) : super(key: key);

  @override
  State<Tab5> createState() => _Tab5State();
}

class _Tab5State extends State<Tab5> {
  final List<List<String>> familiarOptions = [
    ["Very Familiar", "I'm a nutrition expert"],
    ["Somewhat Familiar", "I know few things related nutrients"],
    ["Not Familiar", "I don't have a clue"]
  ];

  String choosenFamiliar = "";

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
                    "How familiar are you with nutrients ?",
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
                      familiarOptions.length,
                      (index) => Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            width: double.infinity,
                            child: CustomButtonWithSubTitle(
                              text: familiarOptions[index][0],
                              subText: familiarOptions[index][1],
                              onPressed: () {
                                choosenFamiliar = familiarOptions[index][0];
                                widget.onAnswered();
                                setState(() {});
                              },
                              backgroundColor:
                                  choosenFamiliar == familiarOptions[index][0]
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
