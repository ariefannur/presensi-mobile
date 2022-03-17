import 'package:presensi_mobile/data/model/base_negative.dart';
import 'package:presensi_mobile/data/model/base_response.dart';
import 'package:presensi_mobile/data/model/consumable.dart';
import 'package:presensi_mobile/data/remote/remote_user.dart';
import 'package:presensi_mobile/data/repository/auth_repository.dart';

class UserRepository {
  final AuthRepository authRepository;
  final RemoteUser remote;
  UserRepository(this.authRepository, this.remote);

  Future<Consumable<BaseResponse, BaseNegative>> changePassword(
      String email, String password) {
    final token = authRepository.getUserSession().token;
    return remote.doChangePassword(token, password, email);
  }
}
