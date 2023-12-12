import 'SecureStorag/secure_storag_model.dart';

class SecureLogin {
  Future getSecureLogin() async {
    String? secureLogin = await SecureStoragModel().readLogin();
    if (secureLogin != null) {
      return secureLogin.toString();
    }
  }
}
