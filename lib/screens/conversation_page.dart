import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  final String userId;
  final String conversationId;
  const ConversationPage({
    Key? key,
    required this.userId,
    required this.conversationId,
  }) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final TextEditingController _editingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late CollectionReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseFirestore.instance
        .collection("conversations/${widget.conversationId}/messages");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://dolphinkaravan.com.tr/wp-content/uploads/2019/12/bay-icon.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text("Burak Can"),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Icon(Icons.phone),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Icon(Icons.camera_alt),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Icon(Icons.more_vert),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "http://1.bp.blogspot.com/-XG2GXoOjreM/UqaioSAS79I/AAAAAAAAPFg/6qPzZIFCZ7A/s1600/spring-desktop-backgrounds-wallpapers.jpg"),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      _ref.orderBy("timeStamp", descending: false).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return !snapshot.hasData
                        ? CircularProgressIndicator()
                        : ListView(
                            controller: _scrollController,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              return ListTile(
                                title: Align(
                                  alignment:
                                      widget.userId != document["senderId"]
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                            left: Radius.circular(10),
                                            right: Radius.circular(10),
                                          )),
                                      child: Text(
                                        "${document["message"]}",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              );
                            }).toList());
                  }),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25),
                        right: Radius.circular(25),
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Icon(
                            Icons.tag_faces,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _editingController,
                          decoration: InputDecoration(
                              hintText: "Type a Message",
                              border: InputBorder.none),
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.attach_file),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ],
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorDark),
                  child: IconButton(
                    onPressed: () async {
                      await _ref.add({
                        "senderId": widget.userId,
                        "message": _editingController.text,
                        "timeStamp": DateTime.now(),
                      });
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 200),
                      );

                      _editingController.text = "";
                    },
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
