import 'package:freezed_annotation/freezed_annotation.dart';
import 'attachment.dart';

import 'category.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    required String name,
    required Category category,
    required Map<String, String> properties,
    required List<Attachment> attachments,
  }) = _Item;

  factory Item.fromJson(Map<String,dynamic> json) => _$ItemFromJson(json);
}
