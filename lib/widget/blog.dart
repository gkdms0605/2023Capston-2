import 'package:flutter/material.dart';
import '../screen/make/QnA/QnADetailScreen.dart';

class BlogWidget extends StatefulWidget {

  const BlogWidget({Key? key}) : super(key: key);

  @override
  _BlogWidgetState createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    likeCount = int.parse('100');

    return Column(
      children: [
        Container(
          width: 340,
          height: 180,
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 340,
                height: 58,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    //ProfileImage(post: widget.post), // 프로필 이미지
                    SizedBox(width: 8),
                    Text(
                      'name',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                width: 340,
                height: 80,
                padding: EdgeInsets.only(left: 30, right: 30),
                color: Colors.white,
                child: Text(
                  'Q. 내가 쓴 글',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 38),
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
                        Text(
                          '저도 궁금해요!',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 45),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.chat),
                          SizedBox(width: 6),
                          Text(
                            '답변 달기',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]
          ),
        ),
      ],
    );
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
      // widget.post['like'] = likeCount.toString();
    });
  }
}
