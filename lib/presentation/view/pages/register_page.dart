import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ryc_desafio_do_modulo_basico/core/injection/injection.dart';
import 'package:ryc_desafio_do_modulo_basico/core/utils/validators.dart';
import 'package:ryc_desafio_do_modulo_basico/domain/entity/task_entiy.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/application/task_cubit.dart';

class RegisterPage extends StatefulWidget {
  final String? getTaskTitle;

  const RegisterPage({this.getTaskTitle, super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TaskCubit _taskCubit = getIt<TaskCubit>();

  final _formKey = GlobalKey<FormState>();

  final _taskTitle = TextEditingController();
  final _taskDescription = TextEditingController();
  final _taskDate = TextEditingController();

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.getTaskTitle != null) {
      _taskTitle.text = widget.getTaskTitle!;
    }
  }

  @override
  void dispose() {
    _taskTitle.dispose();
    _taskDescription.dispose();
    _taskDate.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _taskDate.text = "${_selectedDate!.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _taskDescription,
                  decoration: InputDecoration(
                    labelText: 'Descrição da Tarefa',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _taskDate,
                  validator: (value) => dateValidator(value),
                  decoration: InputDecoration(
                    labelText: 'Data Limite',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
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

                    if (isValid && _selectedDate != null) {
                      final taskEntity = TaskEntity(
                        taskTitle: _taskTitle.text,
                        taskDescription: _taskDescription.text,
                        taskDate: _selectedDate!,
                      );

                      _taskCubit.registerTask(taskEntity);

                      Navigator.pop(context, true);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
