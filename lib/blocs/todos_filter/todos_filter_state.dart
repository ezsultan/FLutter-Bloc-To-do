part of 'todos_filter_bloc.dart';

abstract class TodosFilterState extends Equatable {
  const TodosFilterState();
  
  @override
  List<Object> get props => [];
}

class TodosFilterInitial extends TodosFilterState {}
