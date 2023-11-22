import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/common/custom_dropdown.dart';
import 'package:nutri_app/constants/colors.dart';

class Tab1 extends StatefulWidget {
  final Function onAnswered;
  Tab1({Key? key, required this.onAnswered}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final List<String> ageOptions = [
    "< 18",
    "18 - 24",
    "24 - 32",
    "32 - 40",
    "> 40",
  ];

  String choosenAge = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView(children: [
      Container(
          margin: EdgeInsets.only(top: height * 0.15),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(
                  "How do you identify ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkThemeColor),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Gender",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.065,
                    width: double.infinity,
                    child: CustomDropdownButton(
                      items: const [
                        "Male",
                        "Female",
                      ],
                      hint: "Choose your gender",
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                child: Text(
                  "How old are you ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkThemeColor),
                ),
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
                    ageOptions.length,
                    (index) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          child: CustomButton(
                            text: ageOptions[index],
                            onPressed: () {
                              widget.onAnswered();
                              choosenAge = ageOptions[index];
                              setState(() {});
                            },
                            backgroundColor: choosenAge == ageOptions[index]
                                ? AppColors.choosenOptionGreenColor
                                : Colors.white,
                            foregroundColor: Colors.black87,
                          ),
                        )),
              ),
            ],
          )),
    ]);
  }
}
