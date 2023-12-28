import 'package:flutter/material.dart';
import 'package:start_project/data/community_data.dart';
import 'package:start_project/widget/QnA.dart';
import '../createQnA/QnACreationScreen.dart';

class QnACommunityScreen extends StatefulWidget {
  const QnACommunityScreen({Key? key}) : super(key: key);

  @override
  _QnACommunityScreenState createState() => _QnACommunityScreenState();
}

class _QnACommunityScreenState extends State<QnACommunityScreen> {
  String notificationMessage = "";
  bool isNotificationVisible = false;

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
              height: 93,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () { Navigator.pop(context,); },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text(
                        'Q&A 게시판',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QnAcreationScreen(),
                        ),
                      );
                      showNotification(result);
                    },
                    icon: Icon(Icons.border_color_sharp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: Color.fromRGBO(175, 175, 175, 0.1),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(175,175,175,0.1)
                ),
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: communityData.length,
                      itemBuilder: (context, index) {
                        var item = communityData[index];
                        return QnAWidget(post: item);
                      },
                    ),
                    Positioned(
                      top: 0,left:0,right:0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 500), // 0.5초
                        opacity: isNotificationVisible ? 1.0 : 0.0,
                        child: isNotificationVisible
                            ? Transform.scale(
                                scale: 0.75, // 크기를 조절할 비율
                                child: Container(
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black,width: 2,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
