import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/text_state.dart';

final appStateProvider = ChangeNotifierProvider((ref) => TextState());
