import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/text_state.dart';
import 'package:state_management/theme_state.dart';
import 'text_state_provider.dart';

final colors = [
  Colors.red,
  Colors.white,
  Colors.blue,
  Colors.purple,
  Colors.pink
];

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SecondViewWidget(),
            const Widget3(),
          ],
        ),
      ),
    );
  }
}

class SecondViewWidget extends ConsumerWidget {
  const SecondViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextState appState = ref.watch<TextState>(appStateProvider);

    print('Second View Widget rebuild');
    return Text(appState.language);
  }
}

class Widget3 extends ConsumerWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Second View Widget 3 rebuild');
    return ElevatedButton(
      child: const Text('Change'),
      onPressed: () {
        final state = ref.read<TextState>(appStateProvider);
        state.change(state.language == 'EN' ? 'AR' : 'EN');

        final themeState = ref.read<ThemeState>(themeStateProvider);
        themeState.change(colors[Random().nextInt(4)]);
      },
    );
  }
}
