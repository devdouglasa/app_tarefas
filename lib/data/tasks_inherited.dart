import 'package:flutter/material.dart';
import 'package:my_app/components/task.dart';

class TasksInherited extends InheritedWidget {
  TasksInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Assistir StarWars', 1, 'assets/img/aprender.png'),
    Task('Meditar', 4, 'assets/img/meditar.jpeg'),
    Task('Andar de Bicicleta', 3, 'assets/img/bicicleta.jpg'),
    Task('Jogar Videogame', 2, 'assets/img/jogar.jpg'),
  ];

  void newTask(String nameTask, int difficulty, String image) {
    taskList.add(Task(nameTask, difficulty, image));
  }

  static TasksInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TasksInherited>();
  }

  @override
  bool updateShouldNotify(TasksInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
