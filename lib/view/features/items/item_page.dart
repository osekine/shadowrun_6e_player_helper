import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/view/features/items/item_category_widget.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

class ItemPage extends StatelessWidget {
  final IEquipmentViewModel vm;
  const ItemPage({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      addAutomaticKeepAlives: true,
      itemBuilder: (_, index) {
        final category = vm.categories[index];

        return ItemCategoryWidget(
          categoryName: category.name,
          items: vm.items(category: category),
        );
      },
      itemCount: vm.categories.length,
    );
  }
}
