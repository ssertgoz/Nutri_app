import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';

class Tab4 extends StatefulWidget {
  final Function onAnswered;
  const Tab4({Key? key, required this.onAnswered}) : super(key: key);

  @override
  State<Tab4> createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> {
  final _otherGoalController = TextEditingController();
  final List<List<String>> goalOptions = [
    ["Weight Loss", "assets/images/weight_loss.png"],
    ["Strenght", "assets/images/strenght.png"],
    ["Being Athletic", "assets/images/being_athletic.png"],
    ["Weight Gain", "assets/images/weight_gain.png"],
    ["Being Healthy", "assets/images/being_healthy.png"],
    ["Increase Steps", "assets/images/increase_steps.png"]
  ];
  List<String> otherGoals = [];
  List<String> choosenGoals = [];

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
                    "What are your goals ?",
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
                      "Choose one or multiple options",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // İki sütunlu grid
                      crossAxisSpacing: 18.0, // Sütunlar arası boşluk
                      mainAxisSpacing: 18.0, // Satırlar arası boşluk
                    ),
                    itemCount: goalOptions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: CustomButtonWithIcon(
                            text: goalOptions[index][0],
                            image: AssetImage(goalOptions[index][1]),
                            onPressed: () {
                              if (choosenGoals
                                  .contains(goalOptions[index][0])) {
                                choosenGoals.remove(goalOptions[index][0]);
                              } else {
                                choosenGoals.add(goalOptions[index][0]);
                              }
                              if (choosenGoals.isNotEmpty) {
                                widget.onAnswered();
                              }
                              setState(() {});
                            },
                            backgroundColor:
                                choosenGoals.contains(goalOptions[index][0])
                                    ? AppColors.choosenOptionGreenColor
                                    : Colors.white,
                            foregroundColor: Colors.black87),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Other Goals",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8.0, // Elemanlar arası boşluk
                  runSpacing: 8.0, direction: Axis.horizontal,
                  children: List.generate(
                      otherGoals.length,
                      (index) => IntrinsicWidth(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Center(child: Text(otherGoals[index])),
                            ),
                          )),
                ),
                const SizedBox(
                  height: 30,
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: _otherGoalController,
                            onTapOutside: (value) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            decoration: InputDecoration(
                              hintText: "Nutrient defficiency",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomButton(
                            text: "Add",
                            onPressed: () {
                              otherGoals.add(_otherGoalController.text);
                              _otherGoalController.text = "";
                              setState(() {});
                            },
                            backgroundColor: AppColors.darkThemeColor,
                            foregroundColor: AppColors.themColor,
                            padding: const EdgeInsets.all(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
