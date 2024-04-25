import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter = 1});
  CounterState copyWith({int? count}) {
    return CounterState(counter: count ?? 0);
  }
  @override
  List<Object?> get props => [counter];
}
