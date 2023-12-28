import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController commentController;
  final VoidCallback postComment;

  const CommentInput({Key? key, required this.commentController, required this.postComment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(16),
      child: TextField(
        controller: commentController,
        decoration: InputDecoration(
          hintText: '댓글을 입력하세요',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: postComment,
          ),
        ),
      ),
    );
  }
}
