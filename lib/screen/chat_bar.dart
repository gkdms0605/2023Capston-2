import 'package:flutter/material.dart';
import 'package:start_project/model/chat_model.dart';
import 'package:start_project/widget/chat_screen.dart';

class ChatRoomList extends StatelessWidget {
  final List<ChatRoom> chatRoomList;

  const ChatRoomList(this.chatRoomList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '채팅하기',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffF4F4F4),
          ),
        ),
        titleSpacing: 20,
      ),
      body: ListView.builder(
        itemCount: chatRoomList.length,
        itemBuilder: (context, index) {
          return ChatRoomListItem(
            roomName: chatRoomList[index].roomName,
            subtitle: chatRoomList[index].lastMessage,
            image: chatRoomList[index].image,
            lastTime: chatRoomList[index].lastTime,
          );
        },
      ),
    );
  }
}

class ChatRoomListItem extends StatelessWidget {
  final String roomName;
  final String subtitle;
  final String image;
  final String lastTime;

  const ChatRoomListItem(
      {required this.roomName,
      required this.subtitle,
      required this.image,
      required this.lastTime,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xffF4F4F4)),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        title: Text(
          roomName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(children: [
          SizedBox(
            width: 220,
            child: Text(subtitle),
          ),
          Column(
            children: [
              Text(lastTime),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromRGBO(255, 138, 0, 1)),
              ),
            ],
          ),
        ],
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 30,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatScreen(roomName: roomName),
            ),
          );
        },
      ),
    );
  }
}
