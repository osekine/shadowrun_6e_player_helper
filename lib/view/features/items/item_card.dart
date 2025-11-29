import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

class ItemCard extends StatelessWidget {
  final IItemViewModel vm;
  const ItemCard({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: context.appTheme.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appTheme.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 200, child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Placeholder(),
            )),
            Text(vm.name, style: context.appTheme.header),
            for (int i = 0; i < vm.properties.length; ++i) ...[
              Container(
                color: i % 2 == 1
                    ? context.appTheme.background
                    : context.appTheme.backgroundDark,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vm.properties.entries.elementAt(i).key,
                      style: context.appTheme.description,
                    ),
                    Text(
                      vm.properties.entries.elementAt(i).value,
                      style: context.appTheme.body,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
