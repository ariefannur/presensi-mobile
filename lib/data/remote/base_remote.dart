import 'dart:convert';
import 'package:presensi_mobile/data/model/base_negative.dart';
import 'package:presensi_mobile/data/model/base_response.dart';
import 'package:presensi_mobile/data/model/consumable.dart';

class BaseRemote {
  authHeader(token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token
    };
  }

  BaseResponse getPositive(String response) {
    return BaseResponse.fromJson(jsonDecode(response));
  }

  BaseNegative getNegative(String response) {
    return BaseNegative.fromJson(jsonDecode(response));
  }
}
