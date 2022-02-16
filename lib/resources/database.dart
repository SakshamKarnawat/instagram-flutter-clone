import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/user.dart' as model;

class Database {
  final FirebaseFirestore firestoreInstance;
  Database(this.firestoreInstance);

  Future<model.User?> getUserDetails({required String uid}) async {
    try {
      final snapshot =
          await firestoreInstance.collection('users').doc(uid).get();
      return (model.User.fromSnap(snapshot));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
