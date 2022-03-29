import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_mobile/data/remote/remote_auth.dart';

main() {
  test('Login test should get session token when success login', () async {
    final remoteAuth = RemoteAuth(MockClient((request) async {
      return http.Response(
          '{"data":{"id":1, "token":"ini token", "user_id": 1}, "message": "success", "code": 200}',
          200);
    }));

    final response = await remoteAuth.doLogin("ari@gmail.com", "123");
    expect(response.positive?.token, "ini token");
  });
}
