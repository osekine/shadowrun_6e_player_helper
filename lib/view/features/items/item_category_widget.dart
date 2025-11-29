import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_carousel.dart';

class ItemCategoryWidget extends StatefulWidget {
  const ItemCategoryWidget({super.key});

  @override
  State<ItemCategoryWidget> createState() => _ItemCategoryWidgetState();
}

class _ItemCategoryWidgetState extends State<ItemCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: context.appTheme.backgroundDark,
          child: Text('Category', style: context.appTheme.header),
        ),
        ItemCarousel(),
      ],
    );
  }
}

// class _ItemCategoryDelegate extends MultiChildLayoutDelegate {}
