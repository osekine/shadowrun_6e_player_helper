import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_carousel.dart';

class ItemCategoryWidget extends StatefulWidget {
  const ItemCategoryWidget({super.key});

  @override
  State<ItemCategoryWidget> createState() => _ItemCategoryWidgetState();
}

class _ItemCategoryWidgetState extends State<ItemCategoryWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: BoxBorder.fromLTRB(
                top: BorderSide(width: 2, color: context.appTheme.borderMuted),
              ),
            ),
            child: Text(
              'Category',
              style: context.appTheme.header.copyWith(letterSpacing: 0.4),
            ),
          ),
          const SizedBox(height: 4),
          ItemCarousel(),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
