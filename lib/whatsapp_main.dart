import 'package:flutter/material.dart';
import 'package:wp_clone_provider/core/screens/calls_page.dart';
import 'package:wp_clone_provider/core/screens/camera_page.dart';
import 'package:wp_clone_provider/core/screens/chats_page.dart';
import 'package:wp_clone_provider/core/screens/status_page.dart';

class WhatsAppMain extends StatefulWidget {
  WhatsAppMain({Key? key}) : super(key: key);

  @override
  State<WhatsAppMain> createState() => _WhatsAppMainState();
}

class _WhatsAppMainState extends State<WhatsAppMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showMessage = true;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      _showMessage = _tabController.index == 0 ? false : true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  title: Text("WhatsApp Clone"),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  ],
                ),
              ];
            },
            body: Column(
              children: [
                TabBar(controller: _tabController, tabs: const [
                  Tab(
                    icon: Icon(Icons.camera),
                  ),
                  Tab(
                    text: "Chats",
                  ),
                  Tab(
                    text: "Status",
                  ),
                  Tab(
                    text: "Calls",
                  ),
                ]),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: TabBarView(controller: _tabController, children: [
                      CameraPage(),
                      ChatsPage(),
                      StatusPage(),
                      CallsPage(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _showMessage
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.message),
            )
          : null,
    );
  }
}
