import 'package:flutter/material.dart';
import 'package:start_project/model/chat_model.dart';
import 'package:start_project/screen/chat_screen.dart';
import 'package:start_project/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ChatRoom> chatRoom = [
      ChatRoom.fromMap(
        {
          'roomName': 'XX센터',
          'lastMessage': 'ㅎㅎ 아니예요 다음에도 또 필요하면 언제든지 연락 주세요~~',
          'image':
              'https://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
      ChatRoom.fromMap(
        {
          'roomName': 'YY센터',
          'lastMessage': '저희 센터 주소는 경상북도 의성군 봉양면 봉호로 14입니다! 찾아오실 때 연락 주세요~~',
          'image':
              'https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/09e904cb8f26f.png',
          'lastTime' : '2분전',
        },
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.white,
        ),
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              ChatRoomList(chatRoom),
              Container(
                child: const Center(
                  child: Text('Center'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Home'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Community'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('Profile'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const Bottom(),
        ),
      ),
    );
  }
}
