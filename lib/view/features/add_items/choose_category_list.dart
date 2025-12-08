import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class ChooseCategoryList extends StatelessWidget {
  final void Function(ICategoryViewModel) onChoose;
  final List<ICategoryViewModel> categories;
  const ChooseCategoryList({
    super.key,
    required this.onChoose,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: EdgeInsets.all(16),
    itemBuilder: (BuildContext context, int index) => InkWell(
      splashColor: context.appTheme.highlight,
      onTap: () => onChoose(categories[index]),
      child: Text(
        categories[index].name,
        textAlign: TextAlign.center,
        style: context.appTheme.header,
      ),
    ),
    separatorBuilder: (BuildContext context, int index) =>
        Divider(color: context.appTheme.borderMuted),
    itemCount: categories.length,
  );
}
