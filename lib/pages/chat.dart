import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, dynamic>> chatData = [
    {
      'name': 'Leo Dicarpio',
      'message':
          'saya sudah memperbaiki kelistrikan anda, terimakasih sudah memakai jasa perbaikan saya',
      'time': '10:30 AM',
      'avatar': 'assets/icons/leo.png',
      'unread': 2,
      'read': false,
    },
    {
      'name': 'Tom Holland',
      'message': 'Tolong perbaiki Ac saya',
      'time': '9:45 AM',
      'avatar': 'assets/icons/jane.png',
      'unread': 0,
      'read': true,
    },
    {
      'name': 'Zayn Malik',
      'message': 'terimakasih sudah memperbaiki mesin mobil saya',
      'time': '9:45 AM',
      'avatar': 'assets/icons/jane.png',
      'unread': 0,
      'read': true,
    },
    // Add more chat data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          final chat = chatData[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat['avatar']),
            ),
            title: Text(
              chat['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat['message']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chat['time'],
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                if (chat['unread'] > 0)
                  Container(
                    margin: EdgeInsets.only(top: 4.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      chat['unread'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                if (chat['read'])
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check,
                        size: 16.0,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.check,
                        size: 16.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
