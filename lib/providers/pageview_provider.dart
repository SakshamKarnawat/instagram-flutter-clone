import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageviewProvider = StateNotifierProvider<PageviewProvider, int>((ref) {
  return PageviewProvider();
});

class PageviewProvider extends StateNotifier<int> {
  PageviewProvider() : super(1);
  set value(int index) => state = index;
}
