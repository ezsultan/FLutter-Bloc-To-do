import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todos_filter_event.dart';
part 'todos_filter_state.dart';

class TodosFilterBloc extends Bloc<TodosFilterEvent, TodosFilterState> {
  TodosFilterBloc() : super(TodosFilterInitial()) {
    on<TodosFilterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
