import 'package:flutter/material.dart';
import 'package:flutter_features_tests/notifiers/counter_state.dart';
import 'package:flutter_features_tests/widgets/service_locator.dart';

class Emoji extends StatelessWidget {
  const Emoji({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return ValueListenableBuilder<int>(
        valueListenable: state.counter,
        builder: (ctx, snapshot, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              snapshot < 0 ? Icons.mood_bad : Icons.mood,
              size: 30,
              color: snapshot < 0 ? Colors.red : Colors.green,
            ),
          );
        });
  }
}
