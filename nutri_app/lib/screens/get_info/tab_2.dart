import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_dropdown.dart';
import 'package:nutri_app/constants/colors.dart';

class Tab2 extends StatefulWidget {
  final Function onAnswered;
  const Tab2({Key? key, required this.onAnswered}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  final _weightController = TextEditingController();
  final _tallController = TextEditingController();

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
                    "How much do you weight ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height * 0.027,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkThemeColor),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.065,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              alignment: Alignment.center,
                              child: TextField(
                                onChanged: (value) {
                                  if ((_tallController.text != "") &&
                                      _weightController.text != "") {
                                    widget.onAnswered();
                                  }
                                },
                                controller: _weightController,
                                onTapOutside: (value) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: InputDecoration(
                                  hintText: "75",
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: 1,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            color: Colors.black54,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomDropdownButton(
                              items: const [
                                "Kg",
                                "Pound",
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Center(
                  child: Text(
                    "How tall are you ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height * 0.027,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkThemeColor),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.065,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              alignment: Alignment.center,
                              child: TextField(
                                controller: _tallController,
                                onChanged: (value) {
                                  if ((_tallController.text != "") &&
                                      _weightController.text != "") {
                                    widget.onAnswered();
                                  }
                                },
                                onTapOutside: (value) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: InputDecoration(
                                  hintText: "180",
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: 1,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            color: Colors.black54,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomDropdownButton(
                              items: const [
                                "Cm",
                                "Inch",
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
