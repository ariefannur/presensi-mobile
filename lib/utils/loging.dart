// ignore: constant_identifier_names
import 'env.dart';

// ignore: constant_identifier_names
const DEBUG = FLAVOR == 'DEBUG';

loging(String log) {
  if (DEBUG) {
    print(log);
  }
}
