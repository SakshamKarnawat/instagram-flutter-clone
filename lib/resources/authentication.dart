import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/resources/storage.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Stream to listen to authentication changes:
  Stream<User?> get authStateChange => _auth.authStateChanges();

  //Get user details:
  Future<model.User> getUserDetails() async {
    User? currentUser = _auth.currentUser;
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser?.uid).get();
    return model.User.fromSnap(snapshot);
  }

  //Sign up user:
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List imageFile}) async {
    String result = "Some Error Occured!";
    try {
      //create user:
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final String profilePicURL =
          await Storage().uploadProfilePicToStorage(imageFile /* , username */);
      //add user to database:
      model.User _user = model.User(
        username: username,
        // displayName: "",
        uid: credential.user!.uid,
        email: email,
        bio: bio,
        followers: [],
        following: [],
        profilePicURL: profilePicURL,
        noOfPosts: 0,
      );
      _firestore.collection('users').doc(credential.user!.uid).set(
            _user.toJson(),
          );
      result = "Success!";
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  //Log in user:
  Future<String> logInUser(
      {required String email, required String password}) async {
    String result = "Some error occured";

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      result = "Success!";
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  //Sign out user:
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
