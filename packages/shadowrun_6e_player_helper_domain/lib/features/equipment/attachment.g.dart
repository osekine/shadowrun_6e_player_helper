// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Attachment _$AttachmentFromJson(Map<String, dynamic> json) => _Attachment(
  name: json['name'] as String,
  description: json['description'] as String,
  properties: Map<String, String>.from(json['properties'] as Map),
);

Map<String, dynamic> _$AttachmentToJson(_Attachment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'properties': instance.properties,
    };
