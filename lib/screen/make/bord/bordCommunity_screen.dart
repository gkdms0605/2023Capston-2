import 'package:flutter/material.dart';
import 'package:start_project/data/community_data.dart';
import 'package:start_project/widget/bord.dart';

import '../QnA/QnAcommunity_screen.dart';
import 'createBord/BordCreationScreen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
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
              height: 103,
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '커뮤니티',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BordCreationScreen(),
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
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: communityData.length,
                    itemBuilder: (context, index) {
                      var item = communityData[index];
                      return BordWidget(post: item);
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
                  Positioned(
                    bottom: 10,right: 0.1,
                    child: FloatingActionButton(
                      onPressed: () async {
                        // final result = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => QnACommunityScreen(),
                        //   ),
                        // );
                        // showNotification(result);
                      },
                      backgroundColor: Color.fromRGBO(255, 138, 0, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(Icons.chat),
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
}
