import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'API/apiCadastroToDo.dart';
import 'API/apiCadastroUsuario.dart';
import 'API/apiDeletarTodo.dart';
import 'API/apiListagemTodo.dart';
import 'API/apiLoginUsuario.dart';

class TodoApi {
  String token = '';

  bool isLoading = false;

  Future<LoginDeUsuario?> login(String email, String senha) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local');
    var response = await http.post(
      url,
      body: {
        'identifier': email,
        'password': senha,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      LoginDeUsuario resp = LoginDeUsuario.fromJson(json);
      token = resp.jwt!;
      return resp;
    }
    return null;
  }

  Future<CadastroDeUsuario?> register(
      String email, String nome, String senha) async {
    var url =
        Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local/register');
    var response = await http.post(url, body: {
      'username': nome,
      'email': email,
      'password': senha,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      LoginDeUsuario resp = LoginDeUsuario.fromJson(json);
      token = resp.jwt!;
    }
    return null;
  }

  Future<List<ListagemTodo>> listaTarefas() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $jwt",
      },
    );
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);

      return json.map<ListagemTodo>((value) {
        return ListagemTodo.fromJson(value);
      }).toList();
    } else {
      return [];
    }
  }

  Future registersTodo(String titulo, String descricao, String cor) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.post(url, headers: {
      "Authorization": "Bearer $jwt",
    }, body: {
      "title": titulo,
      "description": descricao,
      "color": cor,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      CadastroTodo resp = CadastroTodo.fromJson(json);
    }
  }
}

class DeleteItem {
  Future<DeletarTodo?> deletarTodo(int? idTodo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    var uri =
        Uri.parse('https://todo-lovepeople.herokuapp.com/todos/${idTodo}');
    Map<String, String> headers = {
      "Authorization": "Bearer $jwt",
    };
    return http.delete(uri, headers: headers).then((response) async {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return DeletarTodo.fromJson(json);
      } else {
        return null;
      }
    });
  }
}
