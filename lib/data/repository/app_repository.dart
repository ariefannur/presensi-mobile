import 'package:presensi_mobile/data/remote/remote_app.dart';

class AppRepository {
  final RemoteApp remoteApp;
  AppRepository(this.remoteApp);

  getVersionApp() async {
    return await remoteApp.getVersionApp();
  }
}
