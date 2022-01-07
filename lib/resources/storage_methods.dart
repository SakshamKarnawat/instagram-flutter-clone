import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Upload profile picture:
  Future<String> uploadProfilePicToStorage(
      Uint8List image /* , String username */) async {
    Reference ref =
        _storage.ref().child('Profile Pictures').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageURL = await snapshot.ref.getDownloadURL();
    return imageURL;
  }
}
