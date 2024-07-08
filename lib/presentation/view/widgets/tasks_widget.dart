import 'package:flutter/material.dart';

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
  var isFinally = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Duration difference = widget.taskDate.difference(now);
    int daysRemaining = difference.inDays;

    final expiredDays = daysRemaining < 0;

    return GestureDetector(
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
                  color: isFinally ? Colors.green : Colors.black,
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dias Restantes'),
                  const SizedBox(height: 2),
                  Text('$daysRemaining'),
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
      onTap: () {
        setState(() {
          isFinally = true;
        });
      },
    );
  }
}
