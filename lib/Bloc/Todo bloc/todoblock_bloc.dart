import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todoblock_event.dart';
part 'todoblock_state.dart';

class TodoblockBloc extends Bloc<TodoblockEvent, TodoblockState> {
  List<String> todostask = [];
  TodoblockBloc() : super(const TodoblockState()) {
    on<AddtodoTask>(_ddtodoTask);
    on<RemovetodoTask>(_removetask);
  }

  void _ddtodoTask(AddtodoTask event, Emitter<TodoblockState> emit) {
    todostask.add(event.task);
    emit(state.copyWith(tasks: List.from(todostask)));
  }
   void _removetask(RemovetodoTask event, Emitter<TodoblockState> emit) {
    todostask.remove(event.index);
    emit(state.copyWith(tasks: List.from(todostask)));
  }
}
