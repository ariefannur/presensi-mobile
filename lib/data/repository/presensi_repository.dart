import 'package:presensi_mobile/data/di.dart';
import 'package:presensi_mobile/data/remote/remote_presensi.dart';

class PresensiRepository {
  final RemotePresensi remotePresensi;
  PresensiRepository(this.remotePresensi);
  final auth = prefManager.getSession();

  getPresensi(String userId) {
    return remotePresensi.getPresensi(auth.token, userId);
  }

  addPresensi(userId, lat, lng, alamat) {
    return remotePresensi.doPresensi(auth.token, userId, lat, lng, alamat);
  }
}
