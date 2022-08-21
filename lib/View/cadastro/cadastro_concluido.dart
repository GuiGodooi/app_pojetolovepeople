import 'package:flutter/material.dart';

class CadastroConcluido extends StatelessWidget {
  const CadastroConcluido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Cadastro Concluído!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: 110,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Começar',
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff3101B9),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                width: 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 180,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(210),
                  topRight: Radius.circular(210),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Center(
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                    child: const Icon(
                      Icons.people,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Os ventos da programação estão indo até você',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF3101B9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
