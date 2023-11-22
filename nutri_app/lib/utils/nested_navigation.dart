import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/common/custom_bottom_nawbar.dart';

class NestedNavigation extends StatelessWidget {
  const NestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: CustomBottomNawBar(callback: _goBranch),
    );
  }
}
