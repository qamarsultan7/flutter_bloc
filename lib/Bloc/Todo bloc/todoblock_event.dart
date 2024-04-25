part of 'todoblock_bloc.dart';

abstract class TodoblockEvent extends Equatable {
  const TodoblockEvent();

  @override
  List<Object> get props => [];
}

class AddtodoTask extends TodoblockEvent {
  final String task;
  const AddtodoTask({required this.task});
  @override
  List<Object> get props => [task];
}

class RemovetodoTask extends TodoblockEvent {
  final Object index;
  const RemovetodoTask({required this.index});
  @override
  List<Object> get props => [index];
}
