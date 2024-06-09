import 'package:flutter/material.dart';

class TasksWidget extends StatelessWidget {
  final String taskTitle;
  final int daysRemaining;
  final bool isExpired;

  const TasksWidget({
    required this.taskTitle,
    required this.daysRemaining,
    required this.isExpired,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2, // Largura da borda
        ),
        borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(taskTitle),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dias Restantes'),
                const SizedBox(height: 2),
                Text(daysRemaining.toString()),
              ],
            ),
            const SizedBox(width: 20),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isExpired ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(
                  isExpired ? Icons.close : Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
