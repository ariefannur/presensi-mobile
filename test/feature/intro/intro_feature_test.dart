import 'package:flutter_test/flutter_test.dart';
import 'package:presensi_mobile/data/remote/remote_app.dart';
import 'package:presensi_mobile/data/repository/app_repository.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  test('get version app', () async {
    final remoteApp = RemoteApp(MockClient((request) async {
      return http.Response(
          '{"data":{"version":"1.0.0"}, "message": "success", "code": 200}',
          200);
    }));

    final repoApp = AppRepository(remoteApp);
    expect(await repoApp.getVersionApp(), "1.0.0");
  });
}
