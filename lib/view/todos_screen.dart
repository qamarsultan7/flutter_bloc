import 'package:flutter/material.dart';
import 'package:flutter_blo/Bloc/Todo%20bloc/todoblock_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos List'),
      ),
      body: BlocBuilder<TodoblockBloc, TodoblockState>(
        buildWhen: (prevoius, current) => true,
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(
              child: Text('No todos'),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todosList[index]),
                    trailing: GestureDetector(
                        onTap: () {
                          context.read<TodoblockBloc>().add(
                              RemovetodoTask(index: state.todosList[index]));
                        },
                        child: const Icon(Icons.delete)),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoblockBloc>().add(AddtodoTask(task: 'QaMaR $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
