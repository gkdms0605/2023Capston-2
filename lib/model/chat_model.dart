class ChatRoom {
  final String roomName;
  final String lastMessage;
  final String image;
  final String lastTime;

  ChatRoom({
    required this.roomName,
    required this.lastMessage,
    required this.image,
    required this.lastTime,
  }); // 기본 생성자

  ChatRoom.fromMap(Map<String, dynamic> map)
      : roomName = map['roomName'],
        lastMessage = map['lastMessage'],
        image = map['image'],
        lastTime = map['lastTime'];
}
