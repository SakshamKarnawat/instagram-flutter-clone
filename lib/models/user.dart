import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  // final String displayName;
  final String uid;
  final String email;
  final String bio;
  final List<dynamic> followers;
  final List<dynamic> following;
  // final List<User> followers;
  // final List<User> following;
  final String profilePicURL;
  final int noOfPosts;
  final bool isPrivate;

  User({
    required this.username,
    // required this.displayName,
    required this.uid,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.profilePicURL,
    required this.noOfPosts,
    this.isPrivate = false,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        // 'displayName': displayName,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'profilePicURL': profilePicURL,
        'noOfPosts': noOfPosts,
        'isPrivate': isPrivate,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return User(
      username: snap['username'],
      uid: snap['uid'],
      // displayName: snapshot['displayName'],
      bio: snap['bio'],
      email: snap['email'],
      profilePicURL: snap['profilePicURL'],
      followers: snap['followers'],
      following: snap['following'],
      noOfPosts: snap['noOfPosts'],
      isPrivate: snap['isPrivate'],
    );
  }
}
