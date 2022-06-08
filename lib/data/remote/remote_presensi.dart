import 'dart:convert';

import 'package:presensi_mobile/data/model/base_negative.dart';
import 'package:presensi_mobile/data/model/base_response.dart';
import 'package:presensi_mobile/data/model/presensi.dart';
import 'package:presensi_mobile/utils/env.dart';

import '../model/consumable.dart';
import 'base_remote.dart';
import 'package:http/http.dart' as http;

class RemotePresensi extends BaseRemote {
  final http.Client client;
  RemotePresensi(this.client);

  Future<Consumable<BaseResponse, BaseNegative>> doPresensi(String token,
      String userId, double lat, double lng, String alamat) async {
    var url = Uri.parse(BASE_URL + "add-presensi");
    final response = await client.post(url,
        headers: authHeader(token),
        body: {"user_id": "1", "la": lat, "lng": lng, "alamat": alamat});

    if (response.statusCode == 200) {
      return Consumable(getPositive(response.body), BaseNegative.None());
    } else {
      return Consumable(null, getNegative(response.body));
    }
  }

  Future<Consumable<List<Presensi>, BaseNegative>> getPresensi(
      String token, String userId) async {
    var url = Uri.parse(BASE_URL + "presensi/$userId");
    final response = await client.get(url, headers: authHeader(token));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      final list = responseJson["data"].map<Presensi>((json) {
        return Presensi.fromJson(json);
      }).toList();
      return Consumable(list, BaseNegative.None());
    } else {
      return Consumable(null, getNegative(response.body));
    }
  }
}
