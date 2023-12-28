import 'package:flutter/material.dart';

class BordCreationScreen extends StatefulWidget {
  const BordCreationScreen({Key? key}) : super(key: key);

  @override
  _BordCreationScreenState createState() => _BordCreationScreenState();
}

class _BordCreationScreenState extends State<BordCreationScreen> {
  final TextEditingController _contentController = TextEditingController();

  Future<bool?> _showCancelDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('게시물 작성을',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text('취소하시겠습니까?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Container(
                        width:238,height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:Color.fromRGBO(243,244,246,1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          '네',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Container(
                        width:238,height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:Color.fromRGBO(243,244,246,1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          '아니요',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> _showCompletionDialog() async {
    Navigator.pop(context, '게시물이 업로드 되었습니다.');
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
              width: 340,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      '게시물 작성하기',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () async {
                            bool? shouldCancel = await _showCancelDialog();
                            if (shouldCancel == true) {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            '취소',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await _showCompletionDialog();
                          },
                          child: Text(
                            '완료',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:22),
              decoration: BoxDecoration(
                border: Border(
                  top:BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                  )
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      height: 380,
                      width: 320,
                      child: TextField(
                        controller: _contentController,
                        maxLines: 9,
                        decoration: InputDecoration(
                          hintText: '게시글을 입력해 주세요! (최대600자)',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
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
