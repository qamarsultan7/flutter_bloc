// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isSwitch;
  double slidervalue;
  SwitchState({this.isSwitch = false, this.slidervalue = 0.2});
  SwitchState copyWith({bool? switched, double? value}) {
    return SwitchState(
        isSwitch: switched ?? isSwitch, slidervalue: value ?? slidervalue);
  }
  @override
  List<Object?> get props => [isSwitch, slidervalue];
}
