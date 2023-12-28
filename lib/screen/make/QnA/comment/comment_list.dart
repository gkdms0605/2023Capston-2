import 'package:flutter/material.dart';
import 'comment_item.dart';

class CommentList extends StatelessWidget {
  final List<Map<String, dynamic>> comments;
  final List<Map<String, dynamic>> userComments;

  const CommentList({Key? key, required this.comments, required this.userComments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: comments.length + userComments.length,
        itemBuilder: (context, index) {
          if (index < comments.length) {
            return CommentItem(comment: comments[index]);
          } else {
            return CommentItem(comment: userComments[index - comments.length]);
          }
        },
      ),
    );
  }
}


