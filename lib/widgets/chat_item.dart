import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/chat_screen.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final int unreadMsgCount;
  ChatItem(
      {this.name, this.message, this.time, this.imageUrl, this.unreadMsgCount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 0,
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ChatScreen.routName, arguments: {
              "name": name,
              "imgUrl": imageUrl,
            });
          },
          leading: Stack(children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(imageUrl),
            ),
            if (unreadMsgCount != 0)
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.orangeAccent,
                child: Text(
                  unreadMsgCount.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              )
          ]),
          title: Text(
            name,
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(),
          ),
          trailing: Text(
            time,
            style: GoogleFonts.montserrat(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
