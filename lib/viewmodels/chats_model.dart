import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wp_clone_provider/core/services/chat_service.dart';
import 'package:wp_clone_provider/models/conversation.dart';
import 'package:wp_clone_provider/viewmodels/base_model.dart';

class ChatsModel extends BaseModel {
  final ChatService _db = GetIt.instance<ChatService>();

  Stream<List<Conversation>> conversations(String userId) {
    return _db.getConversations(userId);
  }
}
