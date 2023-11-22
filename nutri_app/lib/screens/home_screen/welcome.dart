import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_app/blocs/app_bloc/app_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            left: height * 0.03,
            right: height * 0.03,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    state.userName,
                    style: TextStyle(
                        fontSize: height * 0.023,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Image(
                  image: AssetImage("assets/images/john.png"),
                  height: 80,
                  width: 80,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
