import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/features/show_items/item_carousel.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class ItemCategoryWidget extends StatefulWidget {
  final ICategoryViewModel category;
  final ValueListenable<List<IItemViewModel>> items;
  final void Function(ICategoryViewModel? cat) onAddTap;
  final void Function(IItemViewModel, int) onItemDelete;
  const ItemCategoryWidget({
    super.key,
    required this.category,
    required this.items,
    required this.onAddTap,
    required this.onItemDelete,
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
                  widget.category.name,
                  style: context.appTheme.header.copyWith(letterSpacing: 0.4),
                ),
                InkWell(
                  onTap: () => widget.onAddTap(widget.category),
                  child: Icon(
                    Icons.add,
                    color: context.appTheme.textMuted,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          ValueListenableBuilder(
            valueListenable: widget.items,
            builder: (context, items, child) {
              return ItemCarousel(items: items, onItemDelete: widget.onItemDelete,);
            },
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
