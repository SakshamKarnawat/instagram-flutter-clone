import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/providers/auth_provider.dart';
import 'package:instagram_clone/resources/database.dart';

final databaseProvider = FutureProvider((ref) {
  final auth = ref.watch(authProvider);
  final instance = FirebaseFirestore.instance;
  if (auth.currentUser != null) {
    return Database(instance);
  } else {
    return null;
  }
});
