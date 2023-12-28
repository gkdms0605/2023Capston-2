import 'package:flutter/material.dart';
import '../screen/make/bord/Header/bord_proflie.dart';
import '../screen/make/bord/bordDetailScreen.dart';

class BordWidget extends StatefulWidget {
  final Map<String, dynamic> post;

  const BordWidget({Key? key, required this.post}) : super(key: key);

  @override
  _BordWidgetState createState() => _BordWidgetState();
}

class _BordWidgetState extends State<BordWidget> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    likeCount = int.parse(widget.post['like']);

    return Container(
      width: 340,
      height: 318,
      padding: const EdgeInsets.all(9),
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
              ProfileImage(post: widget.post), // 프로필 이미지
              SizedBox(width: 8),
              Text(
                widget.post['user'],
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            width: 340,
            height: 154,
            child: Text(
              widget.post['text'],
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 8,
              style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      _toggleLike();
                    },
                  ),
                  SizedBox(width: 1),
                  Text(
                    '$likeCount',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BordDetailScreen(post: widget.post),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.chat), // 리스트 아이콘
                    SizedBox(width: 4),
                    Text(
                      '댓글 달기',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
      widget.post['like'] = likeCount.toString();
    });
  }

}
