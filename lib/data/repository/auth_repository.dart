import 'dart:async';
import 'package:presensi_mobile/data/remote/remote_auth.dart';

import '../di.dart';

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
      prefManager.saveSesion(response.positive!);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      if (response.negative.code == 503) {
        _controller.add(AuthenticationStatus.unknown);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
      }
    }
  }

  getUserSession() async {
    return await prefManager.getSession();
  }

  Future<bool> logout() async {
    final profile = await prefManager.getProfile();
    if (profile != null) {
      final response = await remote.doLogout(profile.id);
      if (response) {
        prefManager.clearSession();
        _controller.add(AuthenticationStatus.unauthenticated);
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  getController() => _controller.stream;

  dispose() {
    _controller.close();
  }
}
