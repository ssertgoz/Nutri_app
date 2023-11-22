import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';

class Tab6 extends StatefulWidget {
  final Function onAnswered;
  const Tab6({Key? key, required this.onAnswered}) : super(key: key);

  @override
  State<Tab6> createState() => _Tab6State();
}

class _Tab6State extends State<Tab6> {
  final _otherMealController = TextEditingController();
  List<List<String>> mealOptions = [
    ["Vegan", "assets/images/vegan.png"],
    ["Organic", "assets/images/organic.png"],
    ["Vegeterian", "assets/images/vegeterian.png"],
    ["Gluten Free", "assets/images/gluten_free.png"],
    ["Oil Palm Free", "assets/images/oil_palm_free.png"],
    ["Low Cholesterol", "assets/images/low_cholesterol.png"],
    ["Meat Based", "assets/images/meat_based.png"],
    ["Low Sugar", "assets/images/low_sugar.png"]
  ];
  List<String> otherMeals = [];
  List<String> choosenMeals = [];

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
                    "What are your meal's preferences ?",
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
                  width: height * 0.4,
                  height: height * 0.4,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // İki sütunlu grid
                      crossAxisSpacing: 18.0, // Sütunlar arası boşluk
                      mainAxisSpacing: 18.0, // Satırlar arası boşluk
                    ),
                    itemCount: mealOptions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: CustomButtonWithIcon(
                            text: mealOptions[index][0],
                            image: AssetImage(mealOptions[index][1]),
                            onPressed: () {
                              if (choosenMeals
                                  .contains(mealOptions[index][0])) {
                                choosenMeals.remove(mealOptions[index][0]);
                              } else {
                                choosenMeals.add(mealOptions[index][0]);
                              }
                              if (choosenMeals.isNotEmpty) {
                                widget.onAnswered();
                              }
                              setState(() {});
                            },
                            backgroundColor:
                                choosenMeals.contains(mealOptions[index][0])
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
                      "Other Meals",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8.0, // Elemanlar arası boşluk
                  runSpacing: 8.0, direction: Axis.horizontal,
                  children: List.generate(
                      otherMeals.length,
                      (index) => IntrinsicWidth(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Center(child: Text(otherMeals[index])),
                            ),
                          )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                            controller: _otherMealController,
                            onTapOutside: (value) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            decoration: InputDecoration(
                              hintText: "Low Sodium",
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
                              otherMeals.add(_otherMealController.text);
                              _otherMealController.text = "";
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
