import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryc_desafio_do_modulo_basico/core/injection/injection.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/application/task_cubit.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/presenter/main_presenter.dart';

class TasksWidget extends StatefulWidget {
  final String taskTitle;
  final DateTime taskDate;

  const TasksWidget({
    required this.taskTitle,
    required this.taskDate,
    super.key,
  });

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  final taskCubit = getIt<TaskCubit>();

  var isFinally = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Duration difference = widget.taskDate.difference(now);
    int daysRemaining = difference.inDays;

    final expiredDays = daysRemaining < 0;

    if (expiredDays) {
      context.read<MainPresenter>().removeRedHeart();
    }

    return GestureDetector(
      onTap: !isFinally
          ? () {
              setState(() {
                isFinally = true;
              });
              context.read<MainPresenter>().incrementCoin();
            }
          : null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                widget.taskTitle,
                style: TextStyle(
                  decoration: isFinally ? TextDecoration.lineThrough : null,
                  color: expiredDays ? Colors.red : null,
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dias Restantes',
                    style: TextStyle(
                      color: expiredDays ? Colors.red : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$daysRemaining',
                    style: TextStyle(
                      decoration: isFinally ? TextDecoration.lineThrough : null,
                      color: expiredDays ? Colors.red : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: expiredDays ? Colors.red : Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Icon(
                    expiredDays ? Icons.close : Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
