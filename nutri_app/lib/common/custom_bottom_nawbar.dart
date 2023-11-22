import 'package:flutter/material.dart';
import 'package:nutri_app/constants/colors.dart';

class CustomBottomNawBar extends StatefulWidget {
  final void Function(int index) callback;
  const CustomBottomNawBar({super.key, required this.callback});

  @override
  CustomBottomNawBarState createState() => CustomBottomNawBarState();
}

class CustomBottomNawBarState extends State<CustomBottomNawBar> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      widget.callback(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: ImageIcon(
                            const AssetImage("assets/images/test.png"),
                            color: currentIndex == 0
                                ? AppColors.darkThemeColor
                                : Colors.grey.shade400,
                          ),
                          iconSize: size.width * 0.1,
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: ImageIcon(
                              const AssetImage("assets/images/compass.png"),
                              color: currentIndex == 1
                                  ? AppColors.darkThemeColor
                                  : Colors.grey.shade400,
                            ),
                            iconSize: size.width * 0.1,
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: ImageIcon(
                              const AssetImage("assets/images/graph.png"),
                              color: currentIndex == 3
                                  ? AppColors.darkThemeColor
                                  : Colors.grey.shade400,
                            ),
                            iconSize: size.width * 0.1,
                            onPressed: () {
                              setBottomBarIndex(3);
                            }),
                        IconButton(
                            icon: ImageIcon(
                              const AssetImage("assets/images/profile.png"),
                              color: currentIndex == 4
                                  ? AppColors.darkThemeColor
                                  : Colors.grey.shade400,
                            ),
                            iconSize: size.width * 0.1,
                            onPressed: () {
                              setBottomBarIndex(4);
                            }),
                      ],
                    ),
                  ),
                  Center(
                    heightFactor: 0.1,
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: FloatingActionButton(
                          backgroundColor: currentIndex == 2
                              ? AppColors.darkThemeColor
                              : Colors.white,
                          shape: const CircleBorder(),
                          elevation: 5,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          isExtended: true,
                          onPressed: () {
                            setBottomBarIndex(2);
                          },
                          child: ImageIcon(
                            const AssetImage("assets/images/barcode.png"),
                            color: currentIndex == 2
                                ? AppColors.themColor
                                : Colors.grey.shade400,
                            size: size.width * 0.1,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 80);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.13, 0);
    path.lineTo(size.width * 0.25, 0);
    path.quadraticBezierTo(size.width * 0.32, 0, size.width * 0.35, 10);
    // path.arcToPoint(Offset(size.width * 0.55, 30),
    //     radius: Radius.circular(50.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.45, 36, size.width * 0.5, 35);
    path.quadraticBezierTo(size.width * 0.55, 36, size.width * 0.65, 10);
    //path.lineTo(size.width * 0.65, 10);
    path.quadraticBezierTo(size.width * 0.68, 0, size.width * 0.75, 0);
    path.lineTo(size.width * 0.87, 0);
    path.quadraticBezierTo(size.width * 1.0, 0, size.width * 1, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 50, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
