import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SizedBox(
        height: 85,
        child: TabBar(
          labelColor: Color.fromRGBO(255, 138, 0, 1),
          unselectedLabelColor: Color.fromRGBO(175, 175, 175, 1),
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.chat,
                size: 27,
              ),
              child: Text(
                '채팅',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.location_on,
                size: 30,
              ),
              child: Text(
                '센터',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.woman,
                size: 30,
              ),
              child: Text(
                '홈',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.comment,
                size: 28,
              ),
              child: Text(
                '커뮤니티',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              child: Text(
                'MY 정보',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
