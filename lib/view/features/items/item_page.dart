import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_category_widget.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      addAutomaticKeepAlives: true,
      itemBuilder: (_, index) => ItemCategoryWidget(),
      itemCount: 10,
    );
  }
}
