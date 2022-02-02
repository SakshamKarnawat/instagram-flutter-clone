import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/config.dart';

final firebaseInitProvider = FutureProvider<FirebaseApp>((ref) async {
  if (kIsWeb) {
    return await Firebase.initializeApp(options: firebaseConfig);
  } else {
    return await Firebase.initializeApp();
  }
});
