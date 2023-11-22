import 'package:flutter/material.dart';
import 'package:nutri_app/constants/colors.dart';

enum CustomButtonStatus { dark, light, disabled }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final CustomButtonStatus? status;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.padding,
      this.status,
      this.backgroundColor,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        if (status != CustomButtonStatus.disabled) {
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ??
            (status == CustomButtonStatus.dark
                ? AppColors.darkThemeColor
                : AppColors.themColor),
        foregroundColor: foregroundColor ??
            (status == CustomButtonStatus.dark
                ? AppColors.themColor
                : status == CustomButtonStatus.disabled
                    ? Colors.grey
                    : Colors.black87), // Yazı rengi
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: height * 0.02,
        ),
      ),
    );
  }
}

class CustomButtonWithSubTitle extends StatelessWidget {
  final String text;
  final String subText;
  final VoidCallback onPressed;
  final CustomButtonStatus? status;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomButtonWithSubTitle(
      {super.key,
      required this.text,
      required this.subText,
      required this.onPressed,
      this.status,
      this.backgroundColor,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        if (status != CustomButtonStatus.disabled) {
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ??
            (status == CustomButtonStatus.dark
                ? AppColors.darkThemeColor
                : AppColors.themColor),
        foregroundColor: foregroundColor ??
            (status == CustomButtonStatus.dark
                ? AppColors.themColor
                : status == CustomButtonStatus.disabled
                    ? Colors.grey
                    : Colors.black87), // Yazı rengi
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              text,
              style: TextStyle(
                fontSize: height * 0.021,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              subText,
              style: TextStyle(fontSize: height * 0.015, color: Colors.black38),
            ),
          )
        ],
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  final String text;
  final ImageProvider image;
  final VoidCallback onPressed;
  final CustomButtonStatus? status;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomButtonWithIcon(
      {super.key,
      required this.text,
      required this.image,
      required this.onPressed,
      this.status,
      this.backgroundColor,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Adjust opacity here
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (status != CustomButtonStatus.disabled) {
            onPressed();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ??
              (status == CustomButtonStatus.dark
                  ? AppColors.darkThemeColor
                  : AppColors.themColor),
          foregroundColor: foregroundColor ??
              (status == CustomButtonStatus.dark
                  ? AppColors.themColor
                  : status == CustomButtonStatus.disabled
                      ? Colors.grey
                      : Colors.black87), // Yazı rengi
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image(
                image: image,
                color: AppColors.darkThemeColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.011,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
