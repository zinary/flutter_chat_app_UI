import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  final String imgUrl;
  final Map<String, Object> message;
  ChatBubble(
    this.imgUrl,
    this.message,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: message['id'] != 2
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message['id'] == 2)
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(imgUrl),
            ),
          SizedBox(
            width: 10,
          ),
          if (message['id'] != 2)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '10:10am',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.indigo[200],
                ),
              ),
            ),
          if (message['id'] != 2) Spacer(),
          Container(
            // height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: 220,
            decoration: BoxDecoration(
                color:
                    message['id'] == 2 ? Colors.grey[300] : Colors.indigo[100],
                borderRadius: BorderRadius.only(
                  bottomRight:
                      message['id'] == 2 ? Radius.circular(30) : Radius.zero,
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft:
                      message['id'] != 2 ? Radius.circular(30) : Radius.zero,
                )),
            alignment: Alignment.centerLeft,
            child: Text(
              message['message'],
              style: GoogleFonts.poppins(
                // fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.indigo[900],
              ),
            ),
          ),
          if (message['id'] == 2) Spacer(),
          if (message['id'] == 2)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '10:10am',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.indigo[200],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
