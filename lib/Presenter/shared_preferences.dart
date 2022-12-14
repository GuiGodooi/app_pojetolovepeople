import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/API/apiLoginUsuario.dart';

class Preferences {
  final loginkey = '';

  Future<void> loginSalvo(LoginDeUsuario login) async {
    final ok = await SharedPreferences.getInstance();

    ok.setString(loginkey, jsonEncode(login.toJson()));
  }

  Future<LoginDeUsuario?> getLogin() async {
    final ok = await SharedPreferences.getInstance();

    final cache = ok.getString(loginkey);
    if (cache != null && cache.isNotEmpty) {
      return LoginDeUsuario.fromJson(jsonDecode(cache));
    } else {
      return null;
    }
  }
}
