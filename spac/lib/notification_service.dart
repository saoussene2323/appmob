import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> sendFileNotificationToPatient(String patientId, String filePath) async {
    String title = "New File Uploaded";
    String body = "A new file has been uploaded to your profile. Click to view.";

    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'main_channel',
        'Main Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await _notificationsPlugin.show(0, title, body, notificationDetails);

    // Save notification to Firebase
    _saveNotification(title, body, filePath, patientId);
  }

  static Future<void> _saveNotification(String title, String body, String? filePath, String patientId) async {
    final timestamp = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    await FirebaseFirestore.instance.collection('notifications').add({
      'title': title,
      'body': body,
      'timestamp': timestamp,
      'filePath': filePath,
      'patientId': patientId,
      'readStatus': false,
    });
  }

  static Future<List<Map<String, dynamic>>> getNotifications(String patientId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('notifications')
        .where('patientId', isEqualTo: patientId)
        .orderBy('timestamp', descending: true)
        .get();
        
    return querySnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        'title': doc['title'],
        'body': doc['body'],
        'timestamp': doc['timestamp'],
        'filePath': doc['filePath'],
        'readStatus': doc.data().containsKey('readStatus') ? doc['readStatus'] : false,
      };
    }).toList();
  }

  static Future<void> markNotificationAsRead(String id) async {
    await FirebaseFirestore.instance.collection('notifications').doc(id).update({
      'readStatus': true,
    });
  }

  static Future<void> deleteNotification(String id) async {
    await FirebaseFirestore.instance.collection('notifications').doc(id).delete();
  }
}
