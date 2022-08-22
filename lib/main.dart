import 'package:flutter/material.dart';
import 'View/cadastro/cadastro_concluido.dart';
import 'View/cadastro/cadastro_page.dart';
import 'View/login/login_page.dart';
import 'View/tarefas/nova_tarefa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Login(),
    );
  }
}
