import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth.dart';
import '../model/user.dart';

class PrefManager {
  saveProfile(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.toJson().toString());
  }

  Future<User?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString("user");
    return user != null ? User.fromJson(json.decode(user)) : null;
  }

  clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("session");
    prefs.remove("uid");
  }

  saveSesion(Auth auth) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("session", auth.token);
    prefs.setInt("uid", auth.user_id);
  }

  getSession() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("session") ?? "";
    final uid = prefs.getInt("uid") ?? 0;
    return Auth(uid, token);
  }
}
