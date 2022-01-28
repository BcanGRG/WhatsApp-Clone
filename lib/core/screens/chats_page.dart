import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wp_clone_provider/core/screens/conversation_page.dart';

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
                .map(
                  (doc) => ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://dolphinkaravan.com.tr/wp-content/uploads/2019/12/bay-icon.jpg"),
                    ),
                    title: Text(doc["name"]),
                    subtitle: Text(doc["message"]),
                    trailing: Column(
                      children: [
                        const Text("12:23"),
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: const Center(
                            child: Text(
                              "12",
                              textScaleFactor: 0.8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ConversationPage()));
                    },
                  ),
                )
                .toList(),
          );
        });
  }
}
