import 'package:flutter/material.dart';
import 'package:nutri_app/constants/colors.dart';

class RecipesAndSteps extends StatelessWidget {
  const RecipesAndSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.12,
      padding: EdgeInsets.symmetric(horizontal: height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.themColor2,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Adjust opacity here
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                  ),
                ]),
            child: Column(children: [
              const Expanded(
                  child: Image(
                image: AssetImage("assets/images/recipe.png"),
              )),
              Text(
                "Recipes",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ]),
          )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.themColor2,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.5), // Adjust opacity here
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                      ),
                    ]),
                child: Row(
                  children: [
                    const Expanded(
                        child: Image(
                      image: AssetImage("assets/images/foot.png"),
                    )),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Steps",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            "Connect your device to count your steps",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height * 0.012,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
