import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final VoidCallback toggleLike;
  final String likeCount;

  const LikeButton({Key? key, required this.isLiked, required this.toggleLike, required this.likeCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : null,
      ),
      onPressed: toggleLike,
    );
  }
}
