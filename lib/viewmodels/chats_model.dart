import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wp_clone_provider/core/services/firestore_db.dart';
import 'package:wp_clone_provider/models/conversation.dart';

class ChatsModel with ChangeNotifier {
  final FirestoreDb _db = GetIt.instance<FirestoreDb>();

  Stream<List<Conversation>> conversations(String userId) {
    return _db.getConversations(userId);
  }
}
