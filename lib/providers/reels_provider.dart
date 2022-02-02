import 'package:flutter_riverpod/flutter_riverpod.dart';

final reelsProvider = StateNotifierProvider<ReelsProvider, bool>((ref) {
  return ReelsProvider();
});

class ReelsProvider extends StateNotifier<bool> {
  ReelsProvider() : super(false);

  void play() {
    state = true;
  }

  void pause() {
    state = false;
  }
}
