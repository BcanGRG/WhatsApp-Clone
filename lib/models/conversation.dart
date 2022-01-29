import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation {
  String? id;
  String? name;
  String? profileImage;
  String displayMessage;

  Conversation({
    this.id,
    this.name,
    this.profileImage,
    required this.displayMessage,
  });

  factory Conversation.fromSnapshots(DocumentSnapshot snapshot) {
    var data = (snapshot.data() as Map<String, dynamic>);
    return Conversation(
      id: snapshot.id,
      name: data["name"] ?? "Bcan",
      profileImage:
          "https://dolphinkaravan.com.tr/wp-content/uploads/2019/12/bay-icon.jpg",
      displayMessage: data["displayMessage"],
    );
  }
}
