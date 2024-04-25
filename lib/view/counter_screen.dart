import 'package:flutter/material.dart';
import 'package:flutter_blo/Bloc/Counter%20Bloc/counter_bloc.dart';
import 'package:flutter_blo/Bloc/Counter%20Bloc/counter_event.dart';
import 'package:flutter_blo/Bloc/Counter%20Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 40),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Incremnet());
                    },
                    child: const Text('Increment')),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Deccremnet());
                    },
                    child: const Text('Decrement'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
