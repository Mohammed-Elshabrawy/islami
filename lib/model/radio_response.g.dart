// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioResponse _$RadioResponseFromJson(Map<String, dynamic> json) =>
    RadioResponse(
      radios: (json['radios'] as List<dynamic>?)
          ?.map((e) => Radios.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RadioResponseToJson(RadioResponse instance) =>
    <String, dynamic>{'radios': instance.radios};

Radios _$RadiosFromJson(Map<String, dynamic> json) => Radios(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$RadiosToJson(Radios instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
};
