import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/constants/month.dart';
import 'package:sputnik/controllers/home/controller.dart';

class Notification {
  String title;
  String body;
  DateTime date;
  bool viwed;

  Notification(this.title, this.body, this.date, this.viwed);
}

class NotificationPage extends GetView<HomeLayoutController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            _buildHeader(),
            const SizedBox(height: 20),
            _buildNotificationList()
          ]),
        )
      ],
    );
  }
}

_buildHeader() {
  return const Center(
    child: Text(
      "Уведомления",
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}

_buildNotificationList() {
  final List<Notification> notifications = [
    Notification(
      "Эксцентричность",
      ".....",
      DateTime.fromMillisecondsSinceEpoch(1711359033190),
      false,
    ),
    Notification(
      "Эксцентричность",
      ".....",
      DateTime.fromMillisecondsSinceEpoch(1711359033190),
      true,
    ),
    Notification(
      "Эксцентричность",
      ".....",
      DateTime.fromMillisecondsSinceEpoch(1711252921000),
      true,
    ),
    Notification(
      "Эксцентричность",
      ".....",
      DateTime.fromMillisecondsSinceEpoch(1711220400000),
      false,
    ),
    Notification(
      "Эксцентричность",
      ".....",
      DateTime.fromMillisecondsSinceEpoch(1711166521000),
      true,
    ),
  ];

  getFormatedTime(DateTime date) {
    final now = DateTime.now();

    if (DateUtils.isSameDay(now, date)) return "Сегодня";

    if (DateUtils.isSameDay(now.subtract(const Duration(days: 1)), date)) {
      return "Вчера";
    }

    return "${date.day} ${MMonth.ruGenetivus[date.month]}";
  }

  DateTime? prevNotificationDate;

  return Column(
    children: List.generate(
      notifications.length,
      (index) {
        final notification = notifications[index];

        if (DateUtils.isSameDay(prevNotificationDate, notification.date)) {
          return _buildNotificationItem(notifications[index]);
        }

        prevNotificationDate = notification.date;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getFormatedTime(notification.date),
              style: TextStyle(color: MColors.muted, fontSize: 16),
            ),
            const SizedBox(height: 4),
            _buildNotificationItem(notification),
          ],
        );
      },
    ),
  );
}

_buildNotificationItem(Notification notification) {
  getTime(DateTime date) {
    return (date.hour < 10 ? "0${date.hour}:" : "${date.hour}:") +
        (date.minute < 10 ? "0${date.minute}" : "${date.minute}");
  }

  return Stack(
    children: [
      SizedBox(
        width: double.infinity,
        child: Card(
          color: MColors.foreground,
          margin: const EdgeInsets.only(bottom: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.body,
                  style: TextStyle(color: MColors.muted),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: MColors.muted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      getTime(notification.date),
                      style: TextStyle(color: MColors.muted),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      !notification.viwed
          ? Positioned(
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: MColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          : const SizedBox()
    ],
  );
}
