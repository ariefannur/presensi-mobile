import 'dart:async';

import 'package:presensi_mobile/data/model/auth.dart';
import 'package:presensi_mobile/data/remote/remote_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final RemoteAuth remote;
  AuthRepository(this.remote);

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await remote.doLogin(username, password);
    if (response.positive != null) {
      _saveSesion(response.positive!);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  getUserSession() async {
    return await _getSession();
  }

  _saveSesion(Auth auth) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("session", auth.token);
    prefs.setInt("uid", auth.user_id);
  }

  _getSession() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("session") ?? "";
    final uid = prefs.getInt("uid") ?? 0;
    return Auth(uid, token);
  }
}
