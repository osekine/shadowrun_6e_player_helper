import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class ChooseItemList extends StatelessWidget {
  final void Function(IItemViewModel) onChooseItem;
  final List<IItemViewModel> items;
  const ChooseItemList({
    super.key,
    required this.onChooseItem,
    required this.items,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: EdgeInsets.all(16),
    itemBuilder: (BuildContext context, int index) => InkWell(
      splashColor: context.appTheme.highlight,
      onTap: () => onChooseItem(items[index]),
      child: Text(
        items[index].name,
        textAlign: TextAlign.center,
        style: context.appTheme.header,
      ),
    ),
    separatorBuilder: (BuildContext context, int index) =>
        Divider(color: context.appTheme.borderMuted),
    itemCount: items.length,
  );
}
