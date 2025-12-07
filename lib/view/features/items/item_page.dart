import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_category_widget.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class ItemPage extends StatefulWidget {
  final Future<IEquipmentViewModel> Function() factory;
  const ItemPage({super.key, required this.factory});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final vmNotifier = ValueNotifier<IEquipmentViewModel?>(null);

  @override
  void initState() {
    super.initState();
    Future(() async => vmNotifier.value = await widget.factory.call());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vmNotifier,
      builder: (context, vm, child) {
        if (vm == null) return const CircularProgressIndicator();
        return ListView.builder(
          physics: ClampingScrollPhysics(),
          addAutomaticKeepAlives: true,
          itemBuilder: (_, index) {
            final category = vm.categories[index];

            return ItemCategoryWidget(
              category: category,
              items: vm.items(category: category),
            );
          },
          itemCount: vm.categories.length,
        );
      },
    );
  }
}
