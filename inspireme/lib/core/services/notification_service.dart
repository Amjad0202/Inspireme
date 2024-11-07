// lib/core/services/notification_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
    );
  }

  Future<void> scheduleHabitReminder(
    String habitId,
    String title,
    TimeOfDay reminderTime,
    List<String> frequency,
  ) async {
    final now = DateTime.now();
    
    for (final day in frequency) {
      final scheduleDate = _getNextScheduleDate(day, reminderTime);
      
      await _notifications.zonedSchedule(
        int.parse('${habitId.hashCode}${day.hashCode}'),
        'Habit Reminder',
        'Time to complete: $title',
        tz.TZDateTime.from(scheduleDate, tz.local),
        NotificationDetails(
          android: AndroidNotificationDetails(
            'habits_channel',
            'Habits',
            channelDescription: 'Habit tracking reminders',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        payload: habitId,
      );
    }
  }

  Future<void> cancelHabitReminders(String habitId) async {
    // Cancel all notifications for this habit
    await _notifications.cancel(habitId.hashCode);
  }

  DateTime _getNextScheduleDate(String day, TimeOfDay time) {
    final now = DateTime.now();
    final daysOfWeek = {
      'Mon': DateTime.monday,
      'Tue': DateTime.tuesday,
      'Wed': DateTime.wednesday,
      'Thu': DateTime.thursday,
      'Fri': DateTime.friday,
      'Sat': DateTime.saturday,
      'Sun': DateTime.sunday,
    };
    
    final targetDay = daysOfWeek[day]!;
    var scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    
    while (scheduledDate.weekday != targetDay ||
           scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }
    
    return scheduledDate;
  }

  void _handleNotificationResponse(NotificationResponse response) {
    // Handle notification tap
    if (response.payload != null) {
      // Navigate to habit details
      // TODO: Implement navigation
    }
  }
}