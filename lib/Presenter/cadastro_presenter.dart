import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/API/apiLoginUsuario.dart';
import '../Model/model_geral.dart';

class CadastroDeUsuario2 extends ChangeNotifier {
  final api = TodoApi();

  LoginDeUsuario? logins;
  bool carregar = false;

  void obterLogin(String email, String senha, String nome, VoidCallback sucesso,
      VoidCallback falhou) {
    api.register(email, senha, nome).then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('jwt', '${value?.jwt}');
      sucesso();
    }).onError((erro, _) {
      falhou();
    });
  }

  Future<bool> verificacaoToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('jwt') != null) {
      return true;
    } else {
      return false;
    }
  }
}
