import 'package:flutter/material.dart';

class BlogMainImage extends StatelessWidget {
  //final Map<String, dynamic> post;

  const BlogMainImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Null profileImageUrl = null;

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey,
      backgroundImage: null,
    );
  }
}
