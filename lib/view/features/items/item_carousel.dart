import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

import 'item_card.dart';

final _testList = [defaultItem, defaultItem, defaultItem];

class ItemCarousel extends StatefulWidget {
  const ItemCarousel({super.key});

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

    return CustomScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverList(delegate: _ItemCarouselDelegate(children: _testList)),
      ],
    );
  }
}

class _ItemCarouselDelegate extends SliverChildDelegate {
  final List<IItemViewModel> children;

  _ItemCarouselDelegate({required this.children});

  @override
  Widget? build(BuildContext context, int index) {
    if (index == children.length) return null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: ItemCard(vm: children[index])),
    );
  }

  @override
  bool shouldRebuild(_ItemCarouselDelegate oldDelegate) {
    return children != oldDelegate.children;
  }

  @override
  int? get estimatedChildCount => children.length;
}
