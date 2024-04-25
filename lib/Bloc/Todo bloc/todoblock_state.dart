part of 'todoblock_bloc.dart';

class TodoblockState extends Equatable {
  final List<String> todosList;
  const TodoblockState({this.todosList = const []});
  TodoblockState copyWith({List<String>? tasks}) {
    return TodoblockState(todosList:tasks ?? todosList );
  }
  @override
  List<Object> get props => [todosList];
}
