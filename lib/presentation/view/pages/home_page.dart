import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryc_desafio_do_modulo_basico/core/injection/injection.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/application/task_cubit.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/widgets/tasks_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskCubit = getIt<TaskCubit>();

  @override
  void initState() {
    super.initState();
    taskCubit.fetchAlltasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
        bloc: taskCubit,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (tasks) => Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'label',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
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
                  ),
                  const Text('Digite o título da tarefa'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => TasksWidget(
                        taskTitle: tasks[index].taskTitle,
                        daysRemaining: tasks[index].daysRemaining,
                        isExpired: tasks[index].isExpired,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                ],
              ),
            ),
            error: (error) => Center(
              child: Text(error.toString()),
            ),
          );
        });
  }
}
