abstract class SwitchEvent {
  const SwitchEvent();
}

class SwitchEnableorDisable extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slidervalue;
  SliderEvent({required this.slidervalue});
}
