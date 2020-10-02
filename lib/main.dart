import 'package:chat_app_ui/screens/chat_screen.dart';

import 'data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/status_avatar.dart';
import 'widgets/chat_item.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
    routes: {
      ChatScreen.routName: (ctx) => ChatScreen(),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: Colors.indigo[500],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20),
                    child: Text(
                      'Chat with \nyour friends',
                      style: GoogleFonts.montserrat(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 30),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: avatars.length,
                      itemBuilder: (context, index) =>
                          StatusAvatar(avatars[index]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                    itemCount: chats.length,
                    itemBuilder: (context, index) => ChatItem(
                      name: chats[index]['name'],
                      message: chats[index]['message'],
                      time: chats[index]['time'],
                      imageUrl: chats[index]['image'],
                      unreadMsgCount: chats[index]['msgCount'],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
