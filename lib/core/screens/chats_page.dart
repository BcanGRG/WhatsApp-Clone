import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chats").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
          if (snap.hasError) {
            return Text(" Bir Hata Alındı ${snap.error}");
          }
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          return ListView(
            children: snap.data!.docs
                .map((doc) => ListTile(
                      title: Text(doc["name"]),
                      subtitle: Text(doc["message"]),
                    ))
                .toList(),
          );
        });
  }
}
