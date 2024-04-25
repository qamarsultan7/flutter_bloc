import 'package:flutter_blo/Bloc/example%202/switch_event.dart';
import 'package:flutter_blo/Bloc/example%202/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<SwitchEnableorDisable>(_enableorDisable);
    on<SliderEvent>(_slider);
  }

  void _enableorDisable(
      SwitchEnableorDisable event, Emitter<SwitchState> emit) {
    emit(state.copyWith(switched: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(value: event.slidervalue));
  }
}
