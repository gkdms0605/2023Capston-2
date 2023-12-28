import 'package:flutter/material.dart';
import '../bord/Header/bord_proflie.dart';
import '../bord/like/like_btn.dart';
import 'comment/comment_input.dart';
import 'comment/comment_list.dart';

class QnADetailScreen extends StatefulWidget {
  final Map<String, dynamic> post;

  const QnADetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  _QnADetailScreenState createState() => _QnADetailScreenState();
}

class _QnADetailScreenState extends State<QnADetailScreen> {
  TextEditingController _commentController = TextEditingController();
  List<Map<String, dynamic>> _comments = [];
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A 게시판'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ProfileImage(post: widget.post),
                        SizedBox(width: 8),
                        Text(
                          widget.post['user'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: 340,
                      height: 80,
                      padding: EdgeInsets.only(left: 15,right:30),
                      color: Colors.white, // 배경 색상 설정
                      child: Text(
                        'Q. ${widget.post['text']}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LikeButton(isLiked: _isLiked, toggleLike: _toggleLike, likeCount: widget.post['like']),
                        Text(
                          widget.post['like'],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),SizedBox(width: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            CommentList(comments: widget.post['comments'], userComments: _comments),
            CommentInput(commentController: _commentController, postComment: _postComment),
          ],
        ),
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        int currentLikeCount = int.parse(widget.post['like']);
        widget.post['like'] = (currentLikeCount + 1).toString();
      } else {
        int currentLikeCount = int.parse(widget.post['like']);
        widget.post['like'] = (currentLikeCount - 1).toString();
      }
    });
  }

  void _postComment() {
    setState(() {
      String commentText = _commentController.text.trim();
      if (commentText.isNotEmpty) {
        Map<String, dynamic> newComment = {
          'user': '댓글쓴 사용자',
          'date': DateTime.now().toString(),
          'profileImage': '',
          'commentText': commentText,
        };
        _comments.add(newComment);
        _commentController.clear();
      }
    });
  }
}
