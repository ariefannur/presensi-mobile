import 'package:presensi_mobile/data/remote/base_remote.dart';
import 'package:presensi_mobile/utils/env.dart';
import 'package:http/http.dart' as http;

class RemoteApp extends BaseRemote {
  final http.Client client;
  RemoteApp(this.client);

  Future<String> getVersionApp() async {
    var url = Uri.parse(BASE_URL + "version");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final res = getPositive(response.body);
      return res.data["version"];
    } else {
      return "";
    }
  }
}
