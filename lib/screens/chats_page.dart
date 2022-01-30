import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_clone_provider/core/locator.dart';
import 'package:wp_clone_provider/models/conversation.dart';
import 'package:wp_clone_provider/screens/conversation_page.dart';
import 'package:wp_clone_provider/viewmodels/chats_model.dart';

class ChatsPage extends StatelessWidget {
  final String userId = "NVkLyG33bfgi0O17JCG2VeXQ3n73";
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = getIt<ChatsModel>();
    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: StreamBuilder<List<Conversation>>(
          stream: model.conversations(userId),
          builder: (context, AsyncSnapshot<List<Conversation>> snap) {
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
              children: snap.data!
                  .map(
                    (doc) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(doc.profileImage!),
                      ),
                      title: Text(doc.name!),
                      subtitle: Text(doc.displayMessage),
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
                            builder: (context) => ConversationPage(
                                  userId: userId,
                                  conversationId: doc.id!,
                                )));
                      },
                    ),
                  )
                  .toList(),
            );
          }),
    );
  }
}
