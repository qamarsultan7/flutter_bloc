import 'package:bloc/bloc.dart';
import 'package:flutter_blo/Bloc/Counter%20Bloc/counter_event.dart';
import 'package:flutter_blo/Bloc/Counter%20Bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<Incremnet>(_incremnet);
    on<Deccremnet>(_decrement);
  }

  void _incremnet(Incremnet event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.counter + 1));
  }

  void _decrement(Deccremnet event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        count: state.counter <= 0 ? state.counter : state.counter - 1));
  }
}
