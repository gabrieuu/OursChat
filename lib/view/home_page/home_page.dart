import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/add_friend/add_friend.dart';
import 'package:chat_app/view/home_page/list_friends.dart';
import 'package:chat_app/view/home_page/set_username.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appbar(),
        body: Obx(() => (UserController.to.listFriends.isNotEmpty) ? ListFriends() : Center(child: CircularProgressIndicator(),)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddFriend();
              },
            );
          },
          elevation: 2,
          child: const Icon(Icons.message),
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "OursChat",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      bottom: TabBar(
        tabs: const <Widget>[
          Text("CHAT"),
          Text("STATUS"),
          Text("CALLS"),
        ],
        labelPadding: const EdgeInsets.symmetric(vertical: 10),
        indicatorColor: Colors.green[900],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
          splashRadius: 20,
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
                onTap: AuthService.to.logOut,
                child: const ListTile(
                  title: Text("Log Out"),
                )),
            PopupMenuItem(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SetUsername();
                    },
                  );
                },
                child: const ListTile(
                  title: Text("Set Username"),
                )),
          ],
        )
      ],
      //backgroundColor: Colors.white,
    );
  }
}
