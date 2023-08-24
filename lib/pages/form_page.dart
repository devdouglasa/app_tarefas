import 'package:flutter/material.dart';
import 'package:my_app/data/tasks_inherited.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Nova Tarefa",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10)),
              width: 360,
              height: 670,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Nome",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Dificuldade",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira uma URL de imagem.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Imagem",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/img/nophoto.png"),
                        fit: BoxFit.cover,
                        scale: 1,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(nameController.text);
                        print(int.parse(difficultyController.text));
                        print(imageController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Adicionando nova Tarefa...'),
                          ),
                        );
                        TasksInherited.of(context)?.newTask(nameController as String, imageController as String, difficultyController as int);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Adicionar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
