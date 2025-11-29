import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_carousel.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_category_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLightTheme = true;

  void _toggleTheme() {
    isLightTheme = !isLightTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isLightTheme
          ? ThemeData.light().copyWith(extensions: [lightAppTheme])
          : ThemeData.dark().copyWith(extensions: [darkAppTheme]),
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: context.appTheme.background,
            body: ItemCategoryWidget(),
            floatingActionButton: FloatingActionButton(onPressed: _toggleTheme),
          );
        },
      ),
    );
  }
}
