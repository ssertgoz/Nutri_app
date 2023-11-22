import 'package:flutter/material.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:nutri_app/screens/signin/signin_page.dart';

class SiginOptionsScreen extends StatefulWidget {
  const SiginOptionsScreen({Key? key}) : super(key: key);

  @override
  State<SiginOptionsScreen> createState() => _SiginOptionsScreenState();
}

class _SiginOptionsScreenState extends State<SiginOptionsScreen> {
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
                stops: const [0.1, 0.5, 0.9],
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Welcome to',
                          style: TextStyle(
                              fontSize: height * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        'My Nutri App',
                        style: TextStyle(
                            fontSize: height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Let's start our nutritional journey together",
                        style: TextStyle(
                            fontSize: height * 0.0175, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.04),
                            width: double.infinity,
                            child: CustomButton(
                                text: "Get Started",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SigninScreen(),
                                      ));
                                })),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " Or ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: height * 0.02),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.05,
                              width: height * 0.05,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(18),
                              decoration: const BoxDecoration(
                                color: AppColors.themColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Image(
                                image:
                                    AssetImage("assets/images/logo-google.png"),
                              ),
                            ),
                            Container(
                              height: height * 0.05,
                              width: height * 0.05,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(18),
                              decoration: const BoxDecoration(
                                color: AppColors.themColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Image(
                                image:
                                    AssetImage("assets/images/logo-apple.png"),
                              ),
                            ),
                            Container(
                              height: height * 0.05,
                              width: height * 0.05,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(18),
                              decoration: const BoxDecoration(
                                color: AppColors.themColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Image(
                                image: AssetImage(
                                    "assets/images/logo-facebook.png"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: TextStyle(
                                  fontSize: height * 0.017,
                                  color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      fontSize: height * 0.018,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
