import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper/utils/app_colors.dart';
import 'package:shadowrun_6e_player_helper/utils/app_themes.dart';
import 'package:shadowrun_6e_player_helper_view_model/view_model.dart';

class ItemCard extends StatelessWidget {
  final IItemViewModel vm;
  final void Function() onCrossTap;
  const ItemCard({required this.vm, super.key, required this.onCrossTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: context.appTheme.backgroundLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appTheme.border),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: AppColors.black,
            blurRadius: 3,
          ),
          BoxShadow(
            offset: Offset(0, 5),
            color: AppColors.black20,
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(padding: const EdgeInsets.all(16.0)),
                ),
                Text(
                  vm.name,
                  style: context.appTheme.header.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                  child: Padding(padding: const EdgeInsets.all(16.0)),
                ),
                for (int i = 0; i < vm.properties.length; ++i) ...[
                  Container(
                    color: i % 2 == 1
                        ? context.appTheme.backgroundLight
                        : context.appTheme.backgroundDark,
                    padding: EdgeInsets.fromLTRB(
                      16,
                      4,
                      16,
                      // play around
                      i == vm.properties.length - 1 ? 8 : 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          vm.properties.entries.elementAt(i).key,
                          style: context.appTheme.description,
                        ),
                        Text(
                          vm.properties.entries.elementAt(i).value ?? '-',
                          style: context.appTheme.body,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            right: -30,
            top: -30,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapUp: (details) => onCrossTap(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox.square(
                  dimension: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.appTheme.backgroundLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: context.appTheme.borderMuted,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    child: Icon(Icons.close, color: context.appTheme.textMuted),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
