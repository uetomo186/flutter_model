import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var curent = WordPair.random();
  void getNext() {
    curent = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final pair = appState.curent;

    return Card(
      child: Column(
        children: [
          Text('乱数調整'),
          Text(pair.asLowerCase),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
              print('ボタンをタップしました。');
            },
            child: Text('ボタン'),
          ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  final style = theme.textTheme.displayMedium!
      .copyWith(color: theme.colorScheme.onPrimary);

  var pair;
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Text(
      pair.asLowerCase,
      style: style,
    ),
  );
}
