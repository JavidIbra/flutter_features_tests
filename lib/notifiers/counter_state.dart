import 'package:flutter/material.dart';

class CounterState {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter() {
    counter.value--;
  }

  void refreshCounter() {
    counter.value = 0;
  }
}
