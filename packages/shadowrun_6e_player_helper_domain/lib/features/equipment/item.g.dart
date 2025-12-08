// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  id: (json['id'] as num?)?.toInt() ?? null,
  name: json['name'] as String,
  category: $enumDecode(_$CategoryEnumMap, json['category']),
  properties: Map<String, String?>.from(json['properties'] as Map),
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': _$CategoryEnumMap[instance.category]!,
  'properties': instance.properties,
  'attachments': instance.attachments,
};

const _$CategoryEnumMap = {
  Category.weapon: 'weapon',
  Category.armor: 'armor',
  Category.electronics: 'electronics',
  Category.consumables: 'consumables',
  Category.augmentations: 'augmentations',
  Category.magic: 'magic',
  Category.vehicle: 'vehicle',
  Category.drone: 'drone',
};
