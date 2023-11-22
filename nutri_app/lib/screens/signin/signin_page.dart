// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/blocs/app_bloc/app_bloc.dart';
import 'package:nutri_app/blocs/signin_bloc/signin_bloc.dart';
import 'package:nutri_app/common/custom_button.dart';
import 'package:nutri_app/common/custom_dropdown.dart';
import 'package:nutri_app/common/custom_text_field.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:nutri_app/screens/signin/password_rule_test.dart';
import 'package:nutri_app/utils/navigation_utils.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  checkIsOkayToNext(BuildContext context) {
    BlocProvider.of<SigninBloc>(context).add(CheckIsOkayToSignUp(
        name: _nameController.text,
        age: _ageController.text,
        email: _emailController.text,
        password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<SigninBloc, SignInState>(
          builder: (context, state) {
            print(state.status);
            return Scaffold(
              body: Container(
                color: AppColors.themColor,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: height * 0.03,
                      ),
                      margin: EdgeInsets.only(top: height * 0.1),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.1,
                          ),
                          CustomtextField(
                              label: "Full Name",
                              hintText: "John Doe",
                              onChange: () {
                                checkIsOkayToNext(context);
                              },
                              controller: _nameController),
                          Row(
                            children: [
                              Expanded(
                                child: CustomtextField(
                                    label: "Age",
                                    hintText: "24",
                                    onChange: () {
                                      checkIsOkayToNext(context);
                                    },
                                    controller: _ageController),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Gender",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.065,
                                      width: double.infinity,
                                      child: CustomDropdownButton(
                                        items: [
                                          "Male",
                                          "Female",
                                        ],
                                        hint: "Pleas Choose one",
                                        onChanged: (value) {
                                          checkIsOkayToNext(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CustomtextField(
                              label: "Email Address",
                              hintText: "johnDoe@gmail.com",
                              onChange: () {
                                checkIsOkayToNext(context);
                              },
                              controller: _emailController),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              Container(
                                height: height * 0.065,
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  obscureText: state.obscureText,
                                  controller: _passwordController,
                                  onTapOutside: (value) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  onChanged: (value) {
                                    checkIsOkayToNext(context);
                                  },
                                  decoration: InputDecoration(
                                    hintText: '••••••••••••••',
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        state.obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey.shade400,
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<SigninBloc>(context)
                                            .add(ChangeObscureText());
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 20, right: 8, bottom: 8),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Password must contain",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ),
                          PasswordRuleText(
                              text: "1 capital letter",
                              checked: state.isPasswordIncludesOneCapital),
                          PasswordRuleText(
                              text: "1 lower case",
                              checked: state.isPasswordIncludesOneLoverCase),
                          PasswordRuleText(
                              text: "1 number",
                              checked: state.isPasswordIncludesOneNumberl),
                          PasswordRuleText(
                              text: "8 characters",
                              checked: state.isPasswordEightCharacter),
                          Container(
                            margin: EdgeInsets.only(
                                left: height * 0.03,
                                right: height * 0.03,
                                bottom: height * 0.05,
                                top: height * 0.02),
                            width: double.infinity,
                            child: CustomButton(
                              onPressed: () {
                                if (state.status == SignInStatus.okayToNext) {
                                  BlocProvider.of<AppBloc>(context).add(
                                      SetUser(userNmae: _nameController.text));
                                  context.go(RouteNames.getInfoScreen);
                                }
                              },
                              text: "Sign Up",
                              status: state.status == SignInStatus.okayToNext
                                  ? CustomButtonStatus.dark
                                  : CustomButtonStatus.disabled,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.3,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Image(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("assets/images/appbar.png")),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: height * 0.03,
                            ),
                            child: Text(
                              "Let's set up your account",
                              style: TextStyle(
                                  fontSize: height * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
