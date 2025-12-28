import 'package:flutter/material.dart';
import 'package:karbizz/routes/routes.dart';
import 'package:karbizz/screens/home/widgets/side_navigation_drawer.dart';

class AllDutiesScreen extends StatelessWidget {
  const AllDutiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F5FA),
        drawer: const SideNavigationDrawer(currentRoute: Routes.allDuties),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff1F2937)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'All Duties',
            style: TextStyle(
              color: Color(0xff1F2937),
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Color(0xff475467)),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF2F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  labelColor: const Color(0xff1F2937),
                  unselectedLabelColor: const Color(0xff667085),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Pending'),
                    Tab(text: 'Active'),
                    Tab(text: 'Completed'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xffF6F7FB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Color(0xff98A2B3)),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Search by passenger, duty ID, or location...',
                              style: TextStyle(color: Color(0xff98A2B3)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: _FilterPill(label: 'All Status'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _FilterPill(label: 'All Time'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Expanded(
                    child: _SummaryCard(
                      value: '5',
                      label: 'Total',
                      valueColor: Color(0xff2F70FF),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(
                      value: '1',
                      label: 'Pending',
                      backgroundColor: Color(0xffFFF8E1),
                      borderColor: Color(0xffFFD666),
                      valueColor: Color(0xffD38D00),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(
                      value: '4',
                      label: 'Active',
                      backgroundColor: Color(0xffE8F7ED),
                      borderColor: Color(0xffB7E5C9),
                      valueColor: Color(0xff12B76A),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(
                      value: '0',
                      label: 'Completed',
                      valueColor: Color(0xff667085),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const _DutyCard(
                name: 'Priya Sharma',
                statusLabel: 'Ready to Start',
                statusIcon: Icons.hourglass_bottom,
                statusColor: Color(0xffB54708),
                statusBackground: Color(0xffFEF0C7),
                dutyId: 'BKG-2025-001',
                tagLabel: 'Airport Pick up',
                tagBackground: Color(0xffE0E7FF),
                tagTextColor: Color(0xff2457D6),
                time: '2:30 PM',
                distance: '23.2 km',
                duration: '45 mins',
                pickup: 'Indira Gandhi International Airport (DEL)',
                dropoff: 'Connaught Place, New Delhi',
                note: 'Note: Flight arrives at Terminal 3',
              ),
              const SizedBox(height: 20),
              const _DutyCard(
                name: 'Rajesh Kumar',
                statusLabel: 'On the Way',
                statusIcon: Icons.directions_car_filled,
                statusColor: Color(0xff1D4ED8),
                statusBackground: Color(0xffE0EDFF),
                dutyId: 'BKG-2025-002',
                tagLabel: 'HR_KM (Local)',
                tagBackground: Color(0xffE0E7FF),
                tagTextColor: Color(0xff2457D6),
                time: '4:15 PM',
                distance: '12.5 km',
                duration: '25 mins',
                pickup: 'India Gate',
                dropoff: 'Red Fort, Delhi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF6F7FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xff98A2B3)),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.value,
    required this.label,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.valueColor = const Color(0xff1F2937),
  });

  final String value;
  final String label;
  final Color backgroundColor;
  final Color? borderColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff475467),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DutyCard extends StatelessWidget {
  const _DutyCard({
    required this.name,
    required this.statusLabel,
    required this.statusIcon,
    required this.statusColor,
    required this.statusBackground,
    required this.dutyId,
    required this.tagLabel,
    required this.tagBackground,
    required this.tagTextColor,
    required this.time,
    required this.distance,
    required this.duration,
    required this.pickup,
    required this.dropoff,
    this.note,
  });

  final String name;
  final String statusLabel;
  final IconData statusIcon;
  final Color statusColor;
  final Color statusBackground;
  final String dutyId;
  final String tagLabel;
  final Color tagBackground;
  final Color tagTextColor;
  final String time;
  final String distance;
  final String duration;
  final String pickup;
  final String dropoff;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(statusIcon, size: 16, color: statusColor),
                    const SizedBox(width: 6),
                    Text(
                      statusLabel,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                duration,
                style: const TextStyle(color: Color(0xff667085)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Duty ID: $dutyId',
            style: const TextStyle(
              color: Color(0xff475467),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: tagBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              tagLabel,
              style: TextStyle(
                color: tagTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Color(0xff475467)),
              const SizedBox(width: 6),
              Text(
                time,
                style: const TextStyle(color: Color(0xff475467)),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.route, size: 18, color: Color(0xff475467)),
              const SizedBox(width: 6),
              Text(
                distance,
                style: const TextStyle(color: Color(0xff475467)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _LocationRow(
            iconColor: const Color(0xff12B76A),
            iconBackground: const Color(0xffE3F8EC),
            label: pickup,
          ),
          const SizedBox(height: 12),
          _LocationRow(
            iconColor: const Color(0xffF04438),
            iconBackground: const Color(0xffFEECEC),
            label: dropoff,
          ),
          if (note != null) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xffFFFBEB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffFCD34D)),
              ),
              child: Text(
                note!,
                style: const TextStyle(
                  color: Color(0xffB45309),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xff1F2937),
                side: const BorderSide(color: Color(0xffD0D5DD)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.remove_red_eye_outlined),
              label: const Text('View'),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({
    required this.iconColor,
    required this.iconBackground,
    required this.label,
  });

  final Color iconColor;
  final Color iconBackground;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.location_on, size: 18, color: iconColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
