import 'package:flutter_features_tests/notifiers/counter_state.dart';
import 'package:flutter_features_tests/notifiers/list_view_state.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<CounterState>(CounterState());
  getIt.registerSingleton<ListViewState>(ListViewState());
}
