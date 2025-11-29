import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_card.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: ItemCard(vm: defaultItem)),
      ),
    );
  }
}
