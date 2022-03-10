import 'dart:convert';
import 'package:presensi_mobile/data/model/base_negative.dart';
import 'package:presensi_mobile/data/model/base_response.dart';

class BaseRemote {
  BaseResponse getPositive(String response) {
    return BaseResponse.fromJson(jsonDecode(response));
  }

  BaseNegative getNegative(String response) {
    return BaseNegative.fromJson(jsonDecode(response));
  }
}
