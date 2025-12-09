import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/di/injection.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';

import 'view/features/show_items/item_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLightTheme = true;
  final lightTheme = ThemeData.light().copyWith(extensions: [lightAppTheme]);
  final darkTheme = ThemeData.dark().copyWith(extensions: [darkAppTheme]);

  void _toggleTheme() {
    isLightTheme = !isLightTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isLightTheme ? lightTheme : darkTheme,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: context.appTheme.background,
              backgroundColor: context.appTheme.background,
              shadowColor: context.appTheme.border,
              actionsPadding: EdgeInsets.fromLTRB(0, 16, 8, 0),
              actions: [
                IconButton(
                  onPressed: _toggleTheme,
                  icon: Icon(
                    isLightTheme ? Icons.dark_mode : Icons.light_mode,
                    color: context.appTheme.textMuted,
                  ),
                ),
              ],
            ),
            body: const ItemPage(),
          );
        },
      ),
    );
  }
}
