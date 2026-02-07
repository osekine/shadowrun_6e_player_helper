import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/di/injection.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/common/shimmer.dart';
import 'package:shadowrun_6e_player_helper/view/features/add_items/add_item_page.dart';
import 'package:shadowrun_6e_player_helper/view/features/show_items/item_category_widget.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late final IEquipmentViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = getIt.get<IEquipmentViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.background,
      body: ValueListenableBuilder(
        valueListenable: vm.loadingState,
        builder: (context, loadingState, child) {
          if (loadingState == LoadingState.loading ||
              loadingState == LoadingState.initializing) {
            return Shimmer();
          }
          return ValueListenableBuilder(
            valueListenable: vm.categories,
            builder: (context, categories, child) {
              if (categories.isEmpty) return Center(child: Text('Тут пусто'));
              final catList = categories.toList();
              return ListView.builder(
                physics: ClampingScrollPhysics(),
                addAutomaticKeepAlives: true,
                itemBuilder: (_, index) {
                  final category = catList[index];
                  return ItemCategoryWidget(
                    category: category,
                    items: vm.items(category: category),
                    onAddTap: (cat) => _addItem(context, cat),
                    onItemDelete: vm.removeItem,
                  );
                },
                itemCount: categories.length,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.appTheme.backgroundLight,
        onPressed: () async {
          await _addItem(context);
        },
        child: Icon(Icons.add, size: 36, color: context.appTheme.textMuted),
      ),
    );
  }

  Future<void> _addItem(
    BuildContext context, [
    ICategoryViewModel? category,
  ]) async {
    final newItem = await AddItemPage.showAsBottomSheet(
      context,
      category: category,
    );
    if (newItem != null) {
      vm.addItem(newItem);
    }
  }
}
