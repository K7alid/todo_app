import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/tasks_screen/model/task_model.dart';
void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}
final counterStateProvider = StateProvider<List<String>>((ref) {
  return [];
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider).length;
    return Scaffold(
      body: Center(
          child:  Text(
            'Value: $counter',
            style: Theme.of(context).textTheme.headlineMedium,
          )
      ),
        floatingActionButton: FloatingActionButton(
          // access the provider via ref.read(), then increment its state.
          onPressed: () {
            ref.read(counterStateProvider.notifier).state.add('List');
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}