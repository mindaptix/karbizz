import 'package:flutter/material.dart';
import 'package:karbizz/routes/routes.dart';

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({super.key, required this.currentRoute});

  final String currentRoute;

  void _navigateTo(BuildContext context, String route) {
    if (route == currentRoute) {
      Navigator.of(context).pop();
      return;
    }

    Navigator.of(context).pop();
    if (route == Routes.home) {
      Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
      return;
    }

    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffC0C2C6),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff3D4658), Color(0xff101826)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Image.asset('assets/logo.png', height: 40),
                const SizedBox(height: 16),
                const Text(
                  'Good Afternoon',
                  style: TextStyle(color: Color(0xffD0D6E3)),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Arjun Singh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'ID: KRB-001',
                  style: TextStyle(color: Color(0xffD0D6E3)),
                ),
                const SizedBox(height: 14),
                Row(
                  children: const [
                    Icon(Icons.star, color: Color(0xffFDB022)),
                    SizedBox(width: 6),
                    Text(
                      '4.8',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '1,247 trips',
                      style: TextStyle(color: Color(0xffD0D6E3)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xff5A6274),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.directions_car, color: Colors.amber),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Maruti Dzire - DL-01-AB-1234',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff6CC08B),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const _DrawerSectionTitle(title: 'Main'),
                _DrawerTile(
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                  subtitle: 'View active duties and status',
                  isActive: currentRoute == Routes.home,
                  onTap: () => _navigateTo(context, Routes.home),
                ),
                const _DrawerTile(
                  icon: Icons.message_outlined,
                  title: 'Messages',
                  subtitle: 'Chat with passengers & admin',
                  badgeText: '1',
                ),
                const SizedBox(height: 16),
                const _DrawerSectionTitle(title: 'Business'),
                _DrawerTile(
                  icon: Icons.calendar_today_outlined,
                  title: 'All Duties',
                  subtitle: 'View all past and upcoming trips',
                  isActive: currentRoute == Routes.allDuties,
                  onTap: () => _navigateTo(context, Routes.allDuties),
                ),
                _DrawerTile(
                  icon: Icons.receipt_long_outlined,
                  title: 'Expenses',
                  subtitle: 'Track and manage costs',
                  isActive: currentRoute == Routes.expenses,
                  onTap: () => _navigateTo(context, Routes.expenses),
                ),
                const _DrawerTile(
                  icon: Icons.credit_card_outlined,
                  title: 'Payments',
                  subtitle: 'See payouts and settlements',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: const [
                Text(
                  'Karbizz Pro Driver v2.1.0',
                  style: TextStyle(color: Color(0xff3C4B69)),
                ),
                SizedBox(height: 4),
                Text(
                  'Solution Private Limited',
                  style: TextStyle(color: Color(0xff3C4B69)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerSectionTitle extends StatelessWidget {
  const _DrawerSectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Color(0xff65708C),
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badgeText,
    this.isActive = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? badgeText;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xff2F3B52) : const Color(0xffE3E3E3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xff3B4966) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: isActive ? Colors.white : const Color(0xff3C4B69)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isActive ? Colors.white : const Color(0xff1F2937),
                            ),
                          ),
                        ),
                        if (badgeText != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xffFF3B30),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badgeText!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: isActive ? const Color(0xffD0D6E3) : const Color(0xff667085),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
