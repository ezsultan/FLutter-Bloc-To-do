import 'package:bloctodo/blocs/todos/todos_bloc.dart';
import 'package:bloctodo/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController taskController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Todo added successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _inputField('ID', idController),
                _inputField('Task', taskController),
                _inputField('Description', descriptionController),
                ElevatedButton(
                  onPressed: () {
                    var todo = Todo(
                      id: idController.text,
                      task: taskController.text,
                      description: descriptionController.text,
                    );
                    // BlocProvider.of<TodosBloc>(context).add(
                    //   AddTodos(todo: todo),
                    // );
                    context.read<TodosBloc>().add(AddTodos(todo: todo));
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _inputField(
    String field,
    TextEditingController textController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$field: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextField(
            controller: textController,
          ),
        )
      ],
    );
  }
}
