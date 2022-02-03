import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/second_view.dart';
import 'package:state_management/text_state.dart';
import 'package:state_management/theme_state.dart';
import 'text_state_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeState themeState = ref.watch<ThemeState>(themeStateProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: themeState.scaffoldColor),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: const [
              Widget1(),
              Widget2(),
              Widget3(),
              Widget4(),
            ],
          ),
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Widget 1 rebuild');
    return const Text('Widget 1');
  }
}

class Widget2 extends ConsumerWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextState appState = ref.watch<TextState>(appStateProvider);

    print('Widget 2 rebuild');
    return Text(appState.language);
  }
}

class Widget3 extends ConsumerWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Widget 3 rebuild');
    return ElevatedButton(
      child: const Text('Change'),
      onPressed: () {
        final state = ref.read<TextState>(appStateProvider);
        state.change(state.language == 'EN' ? 'AR' : 'EN');
      },
    );
  }
}

class Widget4 extends ConsumerWidget {
  const Widget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextState appState = ref.watch<TextState>(appStateProvider);
    print('Widget 4 rebuild');
    return ElevatedButton(
      child: Text(appState.language),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondView()),
        );
      },
    );
  }
}
