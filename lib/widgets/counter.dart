import 'package:flutter/material.dart';
import 'package:flutter_features_tests/notifiers/counter_state.dart';
import 'package:flutter_features_tests/widgets/service_locator.dart';

class ValuelistenableWidget extends StatelessWidget {
  const ValuelistenableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();

    return ValueListenableBuilder<int>(
        valueListenable: state.counter,
        builder: (context, snapshot, child) {
          TextStyle sstyle() {
            return TextStyle(
              fontSize: snapshot >= 0 ? 30 : 20,
              fontWeight: snapshot >= 0 ? FontWeight.bold : FontWeight.normal,
              color: snapshot >= 0 ? Colors.green : Colors.deepPurpleAccent,
            );
          }

          return Text(
            '$snapshot',
            style: sstyle(),
          );
        });
  }
}
