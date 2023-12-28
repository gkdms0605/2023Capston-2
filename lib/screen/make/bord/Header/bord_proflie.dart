import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final Map<String, dynamic> post;

  const ProfileImage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String profileImageUrl = post['profileImage'];

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey,
      backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl) : null,
    );
  }
}
