// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presensi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Presensi _$PresensiFromJson(Map<String, dynamic> json) => Presensi(
      json['id'] as String,
      json['foto'] as String,
      json['time'] as String,
      json['alamat'] as String,
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PresensiToJson(Presensi instance) => <String, dynamic>{
      'id': instance.id,
      'foto': instance.foto,
      'time': instance.time,
      'alamat': instance.alamat,
      'lat': instance.lat,
      'lng': instance.lng,
    };
