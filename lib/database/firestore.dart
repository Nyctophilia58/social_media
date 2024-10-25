/*

This database stores posts that users have published in the app.
It is stored in a collection called "Posts" in Firebase.

Each post contains the following fields:
- message: The message that the user published.
- email: The email of the user who published the post.
- timestamp: The timestamp when the post was published.

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference posts = FirebaseFirestore.instance.collection('Posts');

  Future<void> addPost(String message) async {
    await posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'Timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('Timestamp', descending: true)
        .snapshots();
    return postsStream;
  }
}