import 'package:flutter/material.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key});

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
            const Text('Título da Tarefa'),
            const Spacer(),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dias Restantes'),
                SizedBox(height: 2),
                Text('20'),
              ],
            ),
            const SizedBox(width: 20),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
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
