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
      appBar: AppBar(
        title: Text("WhatsApp Clone"),
        bottom: TabBar(controller: _tabController, tabs: const [
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
      ),
      body: TabBarView(controller: _tabController, children: [
        CameraPage(),
        ChatsPage(),
        StatusPage(),
        CallsPage(),
      ]),
      floatingActionButton: _showMessage
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.message),
            )
          : null,
    );
  }
}
