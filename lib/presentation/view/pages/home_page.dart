import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryc_desafio_do_modulo_basico/core/injection/injection.dart';
import 'package:ryc_desafio_do_modulo_basico/core/utils/validators.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/application/task_cubit.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/pages/register_page.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/widgets/tasks_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TaskCubit _taskCubit;

  final _formKey = GlobalKey<FormState>();
  final _taskTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskCubit = getIt<TaskCubit>();
    _taskCubit.fetchAlltasks();
  }

  @override
  void dispose() {
    _taskTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _taskCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Task Manager')),
        body: BlocListener<TaskCubit, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (tasks) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tarefa registrada com sucesso!'),
                  ),
                );
              },
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro: $error')),
                );
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
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
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: _taskTitle,
                                  validator: (value) => titleValidator(value),
                                  decoration: InputDecoration(
                                    labelText: 'Título da Tarefa',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(
                                      getTaskTitle: _taskTitle.text,
                                    ),
                                  ),
                                );
                                if (result == true) {
                                  _taskCubit.fetchAlltasks();
                                }
                                _taskTitle.clear();
                                // showModalBottomSheet(
                                //   context: context,
                                //   builder: (context) => Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         vertical: 30),
                                //     child: RegisterPage(
                                //         getTaskTitle: _taskTitle.text),
                                //   ),
                                // );
                                // _taskTitle.clear();
                              },
                              child: Container(
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
                            taskDate: tasks[index].taskDate,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                error: (error) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
