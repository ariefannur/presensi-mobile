import 'package:json_annotation/json_annotation.dart';
part 'presensi.g.dart';

@JsonSerializable()
class Presensi {
  final String id;
  final String foto;
  final String time;
  final String alamat;
  final double lat;
  final double lng;

  Presensi(this.id, this.foto, this.time, this.alamat, this.lat, this.lng);

  factory Presensi.fromJson(Map<String, dynamic> json) =>
      _$PresensiFromJson(json);

  Map<String, dynamic> toJson() => _$PresensiToJson(this);
}
