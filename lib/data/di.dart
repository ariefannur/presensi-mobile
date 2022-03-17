import 'package:presensi_mobile/data/local/pref_manager.dart';
import 'package:presensi_mobile/data/remote/remote_app.dart';
import 'package:presensi_mobile/data/remote/remote_auth.dart';
import 'package:presensi_mobile/data/remote/remote_presensi.dart';
import 'package:presensi_mobile/data/remote/remote_user.dart';
import 'package:presensi_mobile/data/repository/app_repository.dart';
import 'package:presensi_mobile/data/repository/auth_repository.dart';
import 'package:presensi_mobile/data/repository/presensi_repository.dart';
import 'package:presensi_mobile/data/repository/user_repository.dart';
import 'package:http/http.dart' as http;

final httpClient = http.Client();

final RemoteApp remoteAppImpl = RemoteApp(httpClient);
final AppRepository appRepositoryImpl = AppRepository(remoteAppImpl);

final PrefManager prefManager = PrefManager();

final RemoteAuth remoteAuthImpl = RemoteAuth(httpClient);
final AuthRepository authRepositoryImpl = AuthRepository(remoteAuthImpl);

final RemoteUser remoteUserImpl = RemoteUser(httpClient);
final UserRepository userRepositoryImpl =
    UserRepository(authRepositoryImpl, remoteUserImpl);

final RemotePresensi remotePresensiImpl = RemotePresensi(httpClient);
final PresensiRepository presensiRepositoryImpl =
    PresensiRepository(remotePresensiImpl);
