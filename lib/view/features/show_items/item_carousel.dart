import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

import 'item_card.dart';

class ItemCarousel extends StatefulWidget {
  final List<IItemViewModel> items;
  final void Function(IItemViewModel, int) onItemDelete;
  const ItemCarousel({
    super.key,
    required this.items,
    required this.onItemDelete,
  });

  @override
  State<ItemCarousel> createState() => _ItemCarouselState();
}

class _ItemCarouselState extends State<ItemCarousel> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() => debugPrint('${_controller.offset}'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _calcHeight(),
      child: ListView.custom(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(0,0,16,0),
        childrenDelegate: _ItemCarouselDelegate(
          children: widget.items,
          onCrossTap: widget.onItemDelete,
        ),
      ),
    );
  }

  double _calcHeight() {
    // TODO(NLU): add dynamic height calculation
    return 340;
  }
}

class _ItemCarouselDelegate extends SliverChildDelegate {
  final List<IItemViewModel> children;
  final void Function(IItemViewModel, int) onCrossTap;

  _ItemCarouselDelegate({required this.children, required this.onCrossTap});

  @override
  Widget? build(BuildContext context, int index) {
    if (index == children.length) return null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: ItemCard(
        vm: children[index],
        onCrossTap: () => onCrossTap(children[index], index),
      ),
    );
  }

  @override
  bool shouldRebuild(_ItemCarouselDelegate oldDelegate) {
    return children != oldDelegate.children;
  }

  @override
  int? get estimatedChildCount => children.length;
}
