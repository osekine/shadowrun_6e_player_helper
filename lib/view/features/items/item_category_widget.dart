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
  bool _isListVisible = false;
  final a = ValueNotifier<Tween<double>>(Tween<double>(begin: 400.0, end: 0));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTapUp: (_) => _changeListVisibility(),
          child: Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              // color: context.appTheme.background,
              border: BoxBorder.fromLTRB(
                top: BorderSide(width: 1, color: context.appTheme.border),
                bottom: BorderSide(width: 5, color: context.appTheme.border),
              ),
            ),
            child: Text('Category', style: context.appTheme.header),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: a,
          builder: (context, tween, _) {
            return TweenAnimationBuilder(
              tween: tween,
              builder: (context, value, child) {
                return SizedBox(
                  height: value,
                  child: OverflowBox(
                    child: value > 0 ? child : const SizedBox.shrink(),
                  ),
                );
              },
              duration: const Duration(milliseconds: 100),
              child: ItemCarousel(),
            );
          },
        ),
      ],
    );
  }

  void _changeListVisibility() {
    a.value = Tween<double>(begin: a.value.end, end: a.value.begin);
    _isListVisible = !_isListVisible;
    updateKeepAlive();
  }

  @override
  bool get wantKeepAlive => _isListVisible;
}

// class _ItemCategoryDelegate extends MultiChildLayoutDelegate {}
