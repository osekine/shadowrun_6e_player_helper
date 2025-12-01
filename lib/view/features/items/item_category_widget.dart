import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_carousel.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

class ItemCategoryWidget extends StatefulWidget {
  final String categoryName;
  final List<IItemViewModel> items;
  const ItemCategoryWidget({
    super.key,
    required this.categoryName,
    required this.items,
  });

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.categoryName,
                  style: context.appTheme.header.copyWith(letterSpacing: 0.4),
                ),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.add, color: context.appTheme.textMuted, size: 28,),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          ItemCarousel(items: widget.items),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
