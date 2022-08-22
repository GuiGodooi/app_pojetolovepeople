import 'package:flutter/material.dart';
import '../Model/model_geral.dart';

class NovaTarefaPresenter extends ChangeNotifier {
  final api = TodoApi();

  void novaTarefa(String titulo, String descricao, String cor,
      VoidCallback sucesso, VoidCallback falhou) {
    api.registersTodo(titulo, descricao, cor).then((value) {
      sucesso();
    }).onError((Object? erro, _) {
      falhou();
    });
  }
}
