import 'package:flutter/widgets.dart';

class TextState extends ChangeNotifier {
  late AppState state;

  TextState({AppState? appState}) {
    if (appState != null) {
      state = appState;
    } else {
      state = AppState(language: 'EN');
    }
  }

  void change(String text) {
    state = AppState(language: text);
    notifyListeners();
  }

  String get language => state.language;
}

class AppState {
  String language;

  AppState({required this.language});
}
