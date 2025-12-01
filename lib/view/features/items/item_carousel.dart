import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

import 'item_card.dart';

final _testList = [defaultWeapon, defaultWeapon, defaultWeapon];

class ItemCarousel extends StatefulWidget {
  final List<IItemViewModel> items;
  const ItemCarousel({super.key, required this.items});

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
    final amount = _testList.length;

    return SizedBox(
      height: _calcHeight(),
      child: ListView.custom(
        scrollDirection: Axis.horizontal,
        childrenDelegate: _ItemCarouselDelegate(children: widget.items),
      ),
    );
  }

  double _calcHeight() {
    // TODO(NLU): add dynamic height calculation
    return 400;
  }
}

class _ItemCarouselDelegate extends SliverChildDelegate {
  final List<IItemViewModel> children;

  _ItemCarouselDelegate({required this.children});

  @override
  Widget? build(BuildContext context, int index) {
    if (index == children.length) return null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: ItemCard(vm: children[index]),
    );
  }

  @override
  bool shouldRebuild(_ItemCarouselDelegate oldDelegate) {
    return children != oldDelegate.children;
  }

  @override
  int? get estimatedChildCount => children.length;
}
