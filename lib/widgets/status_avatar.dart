import 'package:flutter/material.dart';

class StatusAvatar extends StatelessWidget {
  final String imgUrl;
  StatusAvatar(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 33,
        backgroundColor: Colors.indigo[600],
        child: CircleAvatar(
          backgroundColor: Colors.indigo[600],
          backgroundImage: NetworkImage(imgUrl),
          radius: 30,
        ),
      ),
    );
  }
}
