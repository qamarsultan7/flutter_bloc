import 'package:flutter/material.dart';
import 'package:flutter_blo/Bloc/example%202/switch_bloc.dart';
import 'package:flutter_blo/Bloc/example%202/switch_event.dart';
import 'package:flutter_blo/Bloc/example%202/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                  builder: (context, state) {
                  print('Notificaions');
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(SwitchEnableorDisable());
                      });
                })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous,current)=>previous.slidervalue!=current.slidervalue,
              builder: (context, state) {
                print('Slider at acontainer');
                return Container(
                  width: double.infinity,
                  color: Colors.orange.withOpacity(state.slidervalue),
                  height: 200,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous,current)=>previous.slidervalue!=current.slidervalue,
              builder: (context, state) {
                print('Slider');
                return Slider(
                    value: state.slidervalue,
                    onChanged: (val) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slidervalue: val));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
