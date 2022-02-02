import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateNotifierProvider<Index, int>((ref) {
  return Index();
});

class Index extends StateNotifier<int> {
  Index() : super(0);
  set value(int index) => state = index;
}
