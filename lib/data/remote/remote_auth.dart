import 'dart:convert';

import 'package:presensi_mobile/data/model/auth.dart';
import 'package:presensi_mobile/data/remote/base_remote.dart';
import 'package:presensi_mobile/utils/env.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_mobile/utils/loging.dart';

import '../model/base_negative.dart';
import '../model/consumable.dart';

class RemoteAuth extends BaseRemote {
  Future<Consumable<Auth, BaseNegative>> doLogin(
      String username, String password) async {
    var url = Uri.parse(BASE_URL + "login");
    var response =
        await http.post(url, body: {"email": username, "password": password});
    loging("RESS " + response.body);

    if (response.statusCode == 200) {
      final res = getPositive(response.body);
      return Consumable(Auth.fromJson(res.data), BaseNegative.None());
    } else {
      final res = getNegative(response.body);
      return Consumable(null, res);
    }
  }
}
