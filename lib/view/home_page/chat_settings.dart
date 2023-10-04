import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class ChatSettings extends StatelessWidget {
  const ChatSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("General",style: TextStyle(color: Color.fromRGBO(62, 102, 251, 1),fontSize: 15, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: AuthService.to.logOut,
            leading: Icon(
              Icons.exit_to_app,
              color: Color.fromRGBO(62, 102, 251, 1),
            ),
            title: Text(
              "Exit",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
