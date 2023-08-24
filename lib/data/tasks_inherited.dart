import 'package:flutter/material.dart';
import 'package:my_app/components/task.dart';

class TasksInherited extends InheritedWidget {
  TasksInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Assistir StarWars', 'assets/img/aprender.png', 2),
    Task('Meditar', 'assets/img/meditar.jpeg', 3),
    Task('Andar de Bicicleta', 'assets/img/bicicleta.jpg', 3),
    Task('Jogar Videogame', 'assets/img/jogar.jpg', 2),
  ];

  void newTask(String nameTask, String imagePath, int difficulty) {
    taskList.add(Task(nameTask, imagePath, difficulty));
  }

  static TasksInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TasksInherited>();
  }

  @override
  bool updateShouldNotify(TasksInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
