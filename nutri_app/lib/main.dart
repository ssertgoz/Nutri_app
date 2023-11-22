import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_app/blocs/app_bloc/app_bloc.dart';
import 'package:nutri_app/constants/colors.dart';
import 'package:nutri_app/utils/navigation_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp.router(
        routerConfig: goRouter,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themColor),
          primaryColor: AppColors.themColor,
          useMaterial3: true,
        ),
      ),
    );
  }
}
