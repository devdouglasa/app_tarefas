import 'package:flutter/material.dart';
import 'package:my_app/components/difficulty.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nameTask;
  final String photo;
  final int difficulty;

  Task(this.nameTask, this.difficulty, this.photo, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.photo.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 130,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 80,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nameTask,
                            style: const TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.difficulty),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 5,
                            fixedSize: const Size(66, 60),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                        },
                        child: const SizedBox(
                          height: 60,
                          width: 25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                              Text(
                                "Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 9.0,
                  top: 4.0,
                  right: 9.0,
                  bottom: 4.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 132, 197, 250),
                        value: (widget.difficulty > 0)
                            ? (widget.nivel / widget.difficulty) / 10
                            : 1,
                      ),
                    ),
                    Text(
                      "Nível: ${widget.nivel}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
