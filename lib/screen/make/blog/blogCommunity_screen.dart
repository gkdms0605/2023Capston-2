import 'package:flutter/material.dart';

import 'createBlog/BlogCreationScreen.dart';

class BlogCommunityScreen extends StatefulWidget {
  const BlogCommunityScreen({Key? key}) : super(key: key);

  @override
  _BlogCommunityScreenState createState() => _BlogCommunityScreenState();
}

class _BlogCommunityScreenState extends State<BlogCommunityScreen> {
  String notificationMessage = "";
  bool isNotificationVisible = false;
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final int itemsPerPage = 2;
  final int totalItems = 10;
  final int totalDots = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void showNotification(String message) {
    setState(() {
      notificationMessage = message;
      isNotificationVisible = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isNotificationVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 844,
        width: 340,
        child: Column(
          children: [
            Container(
              height: 103,
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '블로그',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogCreationScreen(),
                        ),
                      );
                      showNotification(result);
                    },
                    icon: Icon(Icons.border_color_sharp),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 19),
            SizedBox(height: 10),
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: Color.fromRGBO(175, 175, 175, 0.1),
              ),
            ),
            Container(
              width: 340,
              height: 223,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFECECEC)),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xFFEFEFEF),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(17.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '이웃 소식',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'AppleSDGothicNeoB00',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/65x65"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(175, 175, 175, 0.1),
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return buildPageContent(index);
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isNotificationVisible ? 1.0 : 0.0,
                      child: isNotificationVisible
                          ? Transform.scale(
                              scale: 0.75,
                              child: Container(
                                height: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  notificationMessage,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(totalDots, (index) {
                        return GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index * itemsPerPage,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == currentPage % totalDots
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageContent(int pageIndex) {
    final startItemIndex = pageIndex * itemsPerPage;
    final endItemIndex = (pageIndex + 1) * itemsPerPage;
    return Container(
      width: 340,
      height: 180,
      margin: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        itemCount: endItemIndex - startItemIndex,
        itemBuilder: (context, itemIndex) {
          final currentIndex = (startItemIndex + itemIndex) % totalItems;
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
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
                      SizedBox(width: 8),
                      Text(
                        'Item #$currentIndex',
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
                          Text(
                            '저도 궁금해요!',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 45),
                      InkWell(
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}