import 'package:local_auth/local_auth.dart';

class Authentication {
  static final auth = LocalAuthentication();
  static Future<bool> canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();
  static Future<bool> authentication() async {
    try {
      if (!await canAuthenticate()) return false;
      return await auth.authenticate(localizedReason: "get into app");
    } catch (e) {
      return false;
    }
  }
}
