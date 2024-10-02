import 'package:flutter/material.dart';
import 'package:flutter_features_tests/models/post.dart';
import 'package:flutter_features_tests/notifiers/list_view_state.dart';
import 'package:flutter_features_tests/widgets/counter.dart';
import 'package:flutter_features_tests/notifiers/counter_state.dart';
import 'package:flutter_features_tests/widgets/emoji.dart';
import 'package:flutter_features_tests/widgets/list_view_container.dart';
import 'package:flutter_features_tests/widgets/service_locator.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  Post post = const Post(userId: 2, id: 11, title: "title", body: "body");

  @override
  void initState() {
    super.initState();

    final state = getIt.get<CounterState>();

    state.counter.addListener(() {
      if (state.counter.value % 10 == 0 && state.counter.value > 0) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                Navigator.of(context).pop();
                final state = getIt.get<CounterState>();
                state.refreshCounter();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: const [
          Emoji(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            const ValuelistenableWidget(),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final state = getIt.get<CounterState>();
                state.refreshCounter();
              },
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(height: 20),
            const ListViewContainer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final state = getIt.get<ListViewState>();
            state.onTapAdding(post);
          }),
    );
  }
}
