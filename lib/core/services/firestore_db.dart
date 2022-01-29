import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wp_clone_provider/models/conversation.dart';

class FirestoreDb {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    var ref = _firestore
        .collection("conversations")
        .where("members", arrayContains: userId);
    return ref.snapshots().map((list) =>
        list.docs.map((snap) => Conversation.fromSnapshots(snap)).toList());
  }
}
