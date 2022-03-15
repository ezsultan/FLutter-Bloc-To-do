import 'package:bloctodo/blocs/todos/todos_bloc.dart';
import 'package:bloctodo/model/model.dart';
import 'package:bloctodo/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              const LoadTodos(
                todos: [
                  Todo(
                    id: '1',
                    task: 'Sample task 1',
                    description: 'this is sample to do',
                  ),
                  Todo(
                    id: '2',
                    task: 'Sample task 2',
                    description: 'this is sample to do 2',
                  )
                ],
              ),
            ),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
