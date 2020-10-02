import 'package:chat_app_ui/widgets/chat_bubble.dart';

import '../data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  static const routName = 'chat-screen';
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> data = ModalRoute.of(context).settings.arguments;
    final name = data['name'];
    final imgUrl = data['imgUrl'];
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              color: Colors.indigo[500],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text(
                          'Back',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.indigo[200],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text(
                          'Search',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.indigo[200],
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: GoogleFonts.montserrat(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.indigo[300],
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.indigo[300],
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                          itemCount: messages.length,
                          itemBuilder: (context, index) =>
                              ChatBubble(imgUrl, messages[index]),
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200]),
                        padding: EdgeInsets.only(left: 20, right: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo[500],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                    iconSize: 20,
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                              hintText: 'Type Your Message...',
                              hintStyle: GoogleFonts.poppins(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
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
