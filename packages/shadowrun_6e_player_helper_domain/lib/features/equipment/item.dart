import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    required String name,
    required Category category,
    required Map<String, String> peoperties,
  }) = _Item;

  factory Item.fromJson(Map<String,dynamic> json) => _$ItemFromJson(json);
}
