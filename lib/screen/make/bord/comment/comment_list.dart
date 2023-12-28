import 'package:flutter/material.dart';

import 'comment_header.dart';

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

class CommentItem extends StatelessWidget {
  final Map<String, dynamic> comment;

  const CommentItem({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileImageForComment(comment: comment),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment['user'],
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    comment['date'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 11),
          Row(
            children: [
              SizedBox(width: 48),
              Expanded(
                child: Text(
                  comment['commentText'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
