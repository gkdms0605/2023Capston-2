import 'package:flutter/material.dart';

class ProfileImageForComment extends StatelessWidget {
  final Map<String, dynamic> comment;

  const ProfileImageForComment({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String profileImageUrl = comment['profileImage'];

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey,
      backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl) : null,
    );
  }
}
