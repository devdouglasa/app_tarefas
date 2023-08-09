import 'package:flutter/material.dart';
import 'package:my_app/components/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const SizedBox(),
        title: const Text(
          "Tarefas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(microseconds: 1000),
        child: ListView(
          children: const [
            Task(
                "Aprendendo Flutter",
                "assets/img/ler.jpg",
                4),
            Task(
                'Praticar inglês',
                'assets/img/aprender.png',
                5),
            Task(
                'Meditar',
                'assets/img/meditar.jpeg',
                1),
            Task(
                'Andar de bicicleta',
                'assets/img/bicicleta.jpg',
                2),
            Task('Jogar videogame',
                'assets/img/jogar.jpg', 1),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
