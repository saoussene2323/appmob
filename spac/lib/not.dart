import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'notification_service.dart';

class NotificationsPage extends StatefulWidget {
  final String patientId;

  NotificationsPage({required this.patientId});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    notifications = await NotificationService.getNotifications(widget.patientId);
    setState(() {
      print('Loaded notifications: $notifications');
    });
  }

  void _markAsRead(String id) async {
    await NotificationService.markNotificationAsRead(id);
    _loadNotifications();
  }

  Future<void> _openFile(String fileUrl) async {
    
    await OpenFile.open(fileUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.notifications),
            SizedBox(width: 8),
            Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: notifications.isEmpty
          ? Center(child: Text('No notifications'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                var notification = notifications[index];
                return Column(
                  children: [
                    NotificationTile(
                      id: notification['id']!,
                      title: notification['title']!,
                      body: notification['body']!,
                      time: notification['timestamp']!,
                      readStatus: notification['readStatus']!,
                     filePath: notification['filePath'], // تأكد من وجود 'fileUrl'
                      onDelete: () async {
                        await NotificationService.deleteNotification(notification['id']!);
                        _loadNotifications();
                      },
                      onTap: () async {
                        if (notification['filePath'] != null) {
                          await _openFile(notification['filePath']);
                          _markAsRead(notification['id']!);
                        }
                      },
                    ),
                    Divider(color: Color(0xff00c7a1)),
                  ],
                );
              },
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xff00c7a1), width: 2.0),
          ),
          color: Color(0xff00c7a1),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String id;
  final String title;
  final String body;
  final String time;
  final bool readStatus;
  final String?filePath; // إضافة الملف URL
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const NotificationTile({
    Key? key,
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.readStatus,
    this.filePath, // يمكن أن يكون null
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: readStatus ? Colors.white : Colors.grey[300], // تمييز الإشعارات غير المقروءة
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(body),
          SizedBox(height: 4),
          Text(time, style: TextStyle(color: Colors.grey)),
          if (filePath != null)
            GestureDetector(
              onTap: onTap, // فتح الملف عند النقر
              child: Text(
                'View Attachment',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
      onTap: onTap, // تحديد الإشعار كمقروء عند النقر عليه
    );
  }
}