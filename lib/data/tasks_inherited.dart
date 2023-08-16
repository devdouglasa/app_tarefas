import 'package:flutter/material.dart';
import 'package:my_app/components/task.dart';

class TasksInherited extends InheritedWidget {
  TasksInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Assistir StarWars', 'www.google.com', 2),
    Task('Meditar', 'www.google.com', 3),
    Task('Andar de Bicicleta', 'www.google.com', 3),
    Task('Jogar Videogame', 'www.google.com', 2),
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
