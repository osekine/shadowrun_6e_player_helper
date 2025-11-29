import 'package:flutter/material.dart';
import 'package:shadowrun_6e_player_helper_view_model/shadowrun_6e_player_helper_view_model.dart';

class ItemCard extends StatelessWidget {
  final IItemViewModel vm;
  const ItemCard({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 173, 168, 183),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 200, child: const Placeholder()),
          Text(vm.name), // HEADER
          for (final a in vm.properties.entries) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(a.key), Text(a.value)],
            ),
          ],
        ],
      ),
    );
  }
}
