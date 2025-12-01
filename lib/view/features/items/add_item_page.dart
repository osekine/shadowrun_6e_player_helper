import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

class AddItemPage extends StatefulWidget {
  final ICategoryViewModel? category;
  const AddItemPage({super.key, this.category});

  @override
  State<AddItemPage> createState() => _AddItemPageState();

  static Future<void> showAsBottomSheet(
    BuildContext context,
    ICategoryViewModel? category,
  ) => showModalBottomSheet(
    backgroundColor: context.appTheme.background,
    context: context,
    builder: (_) => AddItemPage(category: category),
  );
}

class _AddItemPageState extends State<AddItemPage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int index) => InkWell(
            splashColor: context.appTheme.highlight,
            onTap: () => _chooseCategory(),
            child: Text(
              '$index',
              textAlign: TextAlign.center,
              style: context.appTheme.header,
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              Divider(color: context.appTheme.borderMuted),
          itemCount: 2,
        ),
        ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int index) => InkWell(
            splashColor: context.appTheme.highlight,
            onTap: () => _chooseItem(),
            child: Text(
              '$index',
              textAlign: TextAlign.center,
              style: context.appTheme.header,
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              Divider(color: context.appTheme.borderMuted),
          itemCount: 2,
        ),
      ],
    );
  }

  void _chooseCategory() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void _chooseItem() {
    Navigator.of(context).pop();
  }
}
