import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ryc_desafio_do_modulo_basico/core/injection/injection.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/application/task_cubit.dart';

class RegisterPage extends StatefulWidget {
  final String? getTaskTitle;

  const RegisterPage({
    this.getTaskTitle,
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final taskCubit = getIt<TaskCubit>();

  final _formKey = GlobalKey<FormState>();

  final _taskTitle = TextEditingController();
  final _taskDescription = TextEditingController();
  final _taskDeadline = TextEditingController();

  @override
  void initState() {
    if (widget.getTaskTitle != null) {
      _taskTitle.text = widget.getTaskTitle!;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _taskTitle.dispose();
    _taskDescription.dispose();
    _taskDeadline.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _taskTitle,
                decoration: InputDecoration(
                  labelText: 'titulo da tarefa',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _taskDescription,
                decoration: InputDecoration(
                  labelText: 'descrição da tarefa',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _taskDeadline,
                decoration: InputDecoration(
                  labelText: 'data limite',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                child: const FaIcon(
                  FontAwesomeIcons.solidFloppyDisk,
                  size: 50,
                  color: Colors.black,
                ),
                onTap: () {
                  final isValid = _formKey.currentState?.validate() ?? false;

                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
