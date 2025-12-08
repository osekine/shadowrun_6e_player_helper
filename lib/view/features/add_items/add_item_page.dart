import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/di/injection.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper/view/common/shimmer.dart';
import 'package:shadowrun_6e_player_helper/view/features/add_items/choose_category_list.dart';
import 'package:shadowrun_6e_player_helper/view/features/add_items/choose_item_list.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class AddItemPage extends StatefulWidget {
  final ICategoryViewModel? category;
  const AddItemPage({super.key, this.category});

  @override
  State<AddItemPage> createState() => _AddItemPageState();

  static Future<void> showAsBottomSheet(
    BuildContext context, {
    ICategoryViewModel? category,
  }) => showModalBottomSheet(
    backgroundColor: context.appTheme.backgroundLight,
    context: context,
    builder: (_) => AddItemPage(category: category),
  );
}

class _AddItemPageState extends State<AddItemPage> {
  late final PageController _controller;
  final _vmNotifier = ValueNotifier<IEquipmentViewModel?>(null);
  final _itemsNotifier = ValueNotifier<List<IItemViewModel>?>(null);

  @override
  void initState() {
    super.initState();
    final initCategory = widget.category;
    unawaited(
      Future(() async {
        _vmNotifier.value = await getIt.getAsync<IEquipmentViewModel>();
        if (initCategory != null) {
          _chooseCategory(initCategory, navigate: false);
        }
      }),
    );

    _controller = PageController(initialPage: initCategory == null ? 0 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _vmNotifier,
      builder: (context, vm, child) {
        if (vm == null) return Shimmer();
        return PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ChooseCategoryList(
              onChoose: _chooseCategory,
              categories: vm.categories,
            ),
            ValueListenableBuilder(
              valueListenable: _itemsNotifier,
              builder: (context, items, child) {
                if (items == null) return Shimmer();
                return ChooseItemList(onChooseItem: _chooseItem, items: items);
              },
            ),
          ],
        );
      },
    );
  }

  void _chooseCategory(ICategoryViewModel category, {bool navigate = true}) {
    _itemsNotifier.value = _vmNotifier.value?.items(category: category);
    if (navigate) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    }
  }

  void _chooseItem(IItemViewModel chosen) {
    Navigator.of(context).pop<IItemViewModel>(chosen);
  }
}
