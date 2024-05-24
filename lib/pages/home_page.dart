import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/widgets/tasks_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'label',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Digite o título da tarefa'),
          const SizedBox(height: 30),
          const TasksWidget(),
          const SizedBox(height: 10),
          const TasksWidget(),
          const SizedBox(height: 10),
          const TasksWidget(),
          const SizedBox(height: 10),
          const TasksWidget(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
