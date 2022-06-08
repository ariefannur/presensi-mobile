import 'package:presensi_mobile/data/model/auth.dart';
import 'package:presensi_mobile/data/remote/base_remote.dart';
import 'package:presensi_mobile/utils/env.dart';
import 'package:http/http.dart' as http;

import '../model/base_negative.dart';
import '../model/consumable.dart';

class RemoteAuth extends BaseRemote {
  final http.Client client;
  RemoteAuth(this.client);

  Future<Consumable<Auth, BaseNegative>> doLogin(
      String username, String password) async {
    var url = Uri.parse(BASE_URL + "login");

    try {
      var response = await client
          .post(url, body: {"email": username, "password": password});

      if (response.statusCode == 200) {
        final res = getPositive(response.body);
        return Consumable(Auth.fromJson(res.data), BaseNegative.None());
      } else {
        final res = getNegative(response.body);
        return Consumable(null, res);
      }
    } catch (e) {
      return Consumable(null, BaseNegative(503, e.toString()));
    }
  }

  Future<bool> doLogout(String userId) async {
    var url = Uri.parse(BASE_URL + "logout");
    try {
      var response = await client.post(url, body: {"user_id": userId});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
