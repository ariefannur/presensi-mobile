import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:presensi_mobile/data/remote/remote_user.dart';
import 'package:http/http.dart' as http;

main() {
  test('Change password should get success when state under test', () async {
    final remoteUser = RemoteUser(MockClient((request) async {
      return http.Response(
          '{"message":"success", "code": 200, "data": { } }', 200);
    }));

    final response =
        await remoteUser.doChangePassword("token", "newPassword", "email");
    expect(response.positive?.code, 200);
  });
}
