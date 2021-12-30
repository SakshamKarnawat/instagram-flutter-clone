import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

      print(credential.user!.uid);

      final String profilePicURL = await StorageMethods()
          .uploadProfilePicToStorage(imageFile /* , username */);

      //add user to database:
      _firestore.collection('users').doc(credential.user!.uid).set({
        'username': username,
        'uid': credential.user!.uid,
        'email': email,
        'password': password,
        'bio': bio,
        'followers': [],
        'following': [],
        'profilePicURL': profilePicURL,
      });
      result = "Success!";
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  //Log in user:
}
