import 'package:flutter/material.dart';

import 'comment_header.dart';

class CommentItem extends StatelessWidget {
  final Map<String, dynamic> comment;

  const CommentItem({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileImageForComment(comment: comment['profileImage']),
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
          SizedBox(height: 8),
          Text(
            comment['commentText'],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

