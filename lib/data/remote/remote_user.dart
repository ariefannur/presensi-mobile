import 'dart:convert';

import 'package:presensi_mobile/data/model/base_negative.dart';
import 'package:presensi_mobile/data/model/base_response.dart';
import 'package:presensi_mobile/data/model/consumable.dart';
import 'package:presensi_mobile/utils/env.dart';
import 'package:http/http.dart' as http;

import 'base_remote.dart';

class RemoteUser extends BaseRemote {
  final http.Client client;
  RemoteUser(this.client);

  Future<Consumable<BaseResponse, BaseNegative>> doChangePassword(
      String token, String newPassword, String email) async {
    var url = Uri.parse(BASE_URL + "change-password");

    try {
      final response = await client.post(url,
          headers: authHeader(token),
          body: json.encode({'email': email, 'password': newPassword}));

      if (response.statusCode == 200) {
        print("200 change");
        return Consumable(getPositive(response.body), BaseNegative.None());
      } else {
        return Consumable(null, getNegative(response.body));
      }
    } catch (e) {
      return Consumable(null, BaseNegative(503, e.toString()));
    }
  }
}
