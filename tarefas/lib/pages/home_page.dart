import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskController = TextEditingController();

  void onSubmit() {
    if (taskController.text.trim().isNotEmpty) {
      setState(() {
        tasks.add(
          Task(title: taskController.text, dateTime: DateTime.now()),
        );
        taskController.clear();
        // print(tasks);
      });
    }
  }

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lista de tarefas",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Adicione uma tarefa",
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                                ),
                                controller: taskController,
                                onSubmitted: (value) {
                                  onSubmit();
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          height: 80,
                          child: ElevatedButton(
                            onPressed: onSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Flexible(
                      child: tasks.isNotEmpty
                          ? ListView(
                              shrinkWrap: true,
                              children: [
                                for (Task task in tasks) TaskItem(task: task),
                              ],
                            )
                          : Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Nenhuma tarefa adicionada!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: Text("Você possui ${tasks.length} tarefas pendentes")),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              tasks.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(48),
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Limpar tudo",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
