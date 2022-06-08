import 'package:presensi_mobile/data/di.dart';
import 'package:presensi_mobile/data/remote/remote_app.dart';

class AppRepository {
  final RemoteApp remoteApp;
  AppRepository(this.remoteApp);

  getVersionApp() async {
    return await remoteApp.getVersionApp();
  }

  setIntro() {
    prefManager.setIsIntro(true);
  }

  getIntro() async {
    return await prefManager.getIsIntro();
  }
}
