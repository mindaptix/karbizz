import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static final List<_NotificationItem> _notifications = [
    _NotificationItem(
      title: 'Driver Assigned',
      message: 'Arjun Singh has been assigned to your ride #CB001. He will arrive in 10 minutes.',
      time: '2 mins ago',
      icon: Icons.directions_car_filled,
      iconColor: Color(0xff16A34A),
      iconBackground: Color(0xffE7F8ED),
      isUnread: true,
    ),
    _NotificationItem(
      title: 'Booking Confirmed',
      message: 'Your ride from IGI Airport to Connaught Place has been confirmed.',
      time: '15 mins ago',
      icon: Icons.check_circle,
      iconColor: Color(0xff2563EB),
      iconBackground: Color(0xffE0EDFF),
      isUnread: true,
    ),
    _NotificationItem(
      title: 'Special Offer!',
      message: 'Get 20% off on your next 3 rides. Valid till end of month.',
      time: '1 hour ago',
      icon: Icons.card_giftcard,
      iconColor: Color(0xffF97316),
      iconBackground: Color(0xffFFF2D7),
    ),
    _NotificationItem(
      title: 'Ride Completed',
      message: 'Your ride #CB002 from India Gate to Red Fort has been completed. Thank you for choosing Karbizz.',
      time: '2 hours ago',
      icon: Icons.check_circle_outline,
      iconColor: Color(0xff2563EB),
      iconBackground: Color(0xffE0EDFF),
    ),
    _NotificationItem(
      title: 'Rating Reminder',
      message: 'Please rate your recent ride with Rajesh Kumar to help us improve our service.',
      time: '3 hours ago',
      icon: Icons.chat_bubble_outline,
      iconColor: Color(0xff9333EA),
      iconBackground: Color(0xffF3E8FF),
    ),
    _NotificationItem(
      title: 'Driver Arriving Soon',
      message: 'Vikram Patel is 2 minutes away from your pickup location.',
      time: 'Yesterday',
      icon: Icons.alarm,
      iconColor: Color(0xff16A34A),
      iconBackground: Color(0xffE7F8ED),
    ),
    _NotificationItem(
      title: 'Premium Membership',
      message: 'Unlock premium benefits and get priority booking for your next ride.',
      time: 'Yesterday',
      icon: Icons.workspace_premium,
      iconColor: Color(0xffF97316),
      iconBackground: Color(0xffFFF2D7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffEEF2F8),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff283454),
                    Color(0xff121B2B),
                  ],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.notifications,
                                  color: Color(0xff1F3A6F),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Notifications',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 4,
                              top: 4,
                              child: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xffFF4B4B),
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xff2B3651),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                color: const Color(0xffF57C00),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white70,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                              tabs: const [
                                Tab(text: 'All (7)'),
                                Tab(text: 'Unread (2)'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          child: const Text('Mark all read'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _NotificationList(items: _notifications),
                  _NotificationList(
                    items: _notifications.where((item) => item.isUnread).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList({required this.items});

  final List<_NotificationItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No unread notifications',
          style: TextStyle(
            color: Color(0xff667085),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _NotificationCard(item: items[index]),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: item.iconBackground,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(item.icon, color: item.iconColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.message,
                  style: const TextStyle(
                    color: Color(0xff475467),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.time,
                  style: const TextStyle(
                    color: Color(0xff667085),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (item.isUnread)
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: Color(0xff2563EB),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class _NotificationItem {
  const _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    this.isUnread = false,
  });

  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final bool isUnread;
}
