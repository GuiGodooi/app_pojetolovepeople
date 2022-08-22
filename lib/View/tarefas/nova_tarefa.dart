import 'package:flutter/material.dart';

class NovaTarefa extends StatefulWidget {
  const NovaTarefa({Key? key}) : super(key: key);

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  final _formkey = GlobalKey<FormState>();
  final _controlerAssignment = TextEditingController();
  final _controlerTitle = TextEditingController();

  late String _colorTarefa = '';
  final _colorsTarefas = ['FFF2CC', 'FFD9F0', 'E8C5FF', 'CAFBFF', 'E3FFE6'];
  var value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: const Text(
                              'Nova Tarefa',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color(0xff3101B9),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: ('Título da tarefa'),
                            hintStyle: const TextStyle(
                              color: Color(0xff3101B9),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xDDA901F7),
                                width: 5,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 50,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText:
                                  ('Escreva uma descrição para sua tarefa'),
                              hintStyle: TextStyle(
                                color: const Color(0xFF3101B9).withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Container(
                            alignment: AlignmentDirectional.topStart,
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            height: 30,
                            child: mapaDeCores(),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 70,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(2, 20, 15, 30),
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(90),
                  topRight: Radius.circular(3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView mapaDeCores() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _colorsTarefas.length,
      itemBuilder: (context, index) {
        final colorButton = '0xFF${_colorsTarefas[index]}';
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: Color(
              int.parse(colorButton),
            ),
            elevation: _colorTarefa == _colorsTarefas[index] ? 10 : 0,
          ),
          onPressed: () {
            setState(() {
              _colorTarefa = _colorsTarefas[index];
            });
          },
          child: const SizedBox(
            width: 20,
          ),
        );
      },
    );
  }
}
