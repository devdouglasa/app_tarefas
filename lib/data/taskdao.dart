import 'package:my_app/components/task.dart';
import 'package:my_app/data/databases.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tablename = 'tasktable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  save(Task tarefa) async {
    final Database bancoDeDados = await getDatabase();
    var isExist = await find(tarefa.nameTask);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (isExist.isEmpty) {
      // A tarefa não existe
      await bancoDeDados.insert(_tablename, taskMap);
    } else {
      await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nameTask]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nameTask;
    mapaDeTarefas[_difficulty] = tarefa.difficulty;
    mapaDeTarefas[_image] = tarefa.photo;
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      tarefas.add(Task(linha[_name], linha[_difficulty], linha[_image]));
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    return toList(result);
  }

  delete(String tarefa) async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [tarefa]);
  }
}
