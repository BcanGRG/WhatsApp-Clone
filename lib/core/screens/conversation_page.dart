import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

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
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Align(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                  right: Radius.circular(10),
                                )),
                            child: Text(
                              "Deneme Mesajı",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    );
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
                    children: const [
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
                    onPressed: () {},
                    icon: const Icon(Icons.mic, color: Colors.white),
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
