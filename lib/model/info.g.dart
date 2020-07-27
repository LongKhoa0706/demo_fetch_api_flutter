// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    page: json['page'] as int,
    perPage: json['perPage'] as int,
    total: json['total'] as int,
    totalPages: json['totalPages'] as int,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ad: json['ad'] == null
        ? null
        : Ad.fromJson(json['ad'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'data': instance.data,
      'ad': instance.ad,
    };
