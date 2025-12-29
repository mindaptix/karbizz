import 'package:flutter/material.dart';
import 'package:karbizz/routes/routes.dart';
import 'package:karbizz/screens/home/widgets/side_navigation_drawer.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F5FA),
        drawer: const SideNavigationDrawer(currentRoute: Routes.expenses),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xff3C4B69)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Expenses',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff101828),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2563EB),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xffE5E7EB),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const TabBar(
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelColor: Color(0xff111827),
                    unselectedLabelColor: Color(0xff475467),
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Expenses'),
                      Tab(text: 'Analytics'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  children: [
                    _OverviewTab(),
                    _ExpensesTab(),
                    _AnalyticsTab(),
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

class _OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: _MetricCard(
                  title: 'Total Earnings',
                  value: '₹8,250',
                  valueColor: Color(0xff16A34A),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
                  title: 'Total Expenses',
                  value: '₹1,055',
                  valueColor: Color(0xffDC2626),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
                  title: 'Net Earnings',
                  value: '₹7,195',
                  valueColor: Color(0xff0F172A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: 'Expense Breakdown',
            child: Column(
              children: const [
                _BreakdownRow(
                  icon: Icons.local_gas_station,
                  label: 'Fuel',
                  amount: '₹650',
                  percentage: '61.6%',
                ),
                _BreakdownRow(
                  icon: Icons.toll,
                  label: 'Toll',
                  amount: '₹120',
                  percentage: '11.4%',
                ),
                _BreakdownRow(
                  icon: Icons.local_parking,
                  label: 'Parking',
                  amount: '₹200',
                  percentage: '19.0%',
                ),
                _BreakdownRow(
                  icon: Icons.credit_card,
                  label: 'Fastag',
                  amount: '₹85',
                  percentage: '8.1%',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: 'Recent Expenses',
            child: Column(
              children: const [
                _ExpenseItem(
                  icon: Icons.local_gas_station,
                  title: 'Fuel',
                  subtitle: 'Petrol pump fill-up',
                  time: '1:45 PM',
                  amount: '₹650',
                ),
                _ExpenseItem(
                  icon: Icons.toll,
                  title: 'Toll',
                  subtitle: 'DND Flyway toll plaza',
                  time: '4:20 PM',
                  amount: '₹120',
                ),
                _ExpenseItem(
                  icon: Icons.local_parking,
                  title: 'Parking',
                  subtitle: 'Airport pickup parking fees',
                  time: '5:30 PM',
                  amount: '₹200',
                ),
                _ExpenseItem(
                  icon: Icons.credit_card,
                  title: 'Fastag',
                  subtitle: 'NH-48 FASTag auto-debit',
                  time: '2:15 PM',
                  amount: '₹85',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpensesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        children: [
          _SectionCard(
            title: 'Filters',
            child: Row(
              children: const [
                Expanded(
                  child: _FilterField(label: 'Type', value: 'All Types'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _FilterField(label: 'Duty', value: 'All Duties'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _ExpenseCard(
            icon: Icons.local_gas_station,
            title: 'Fuel',
            tag: 'fuel',
            tagColor: Color(0xffFEE2E2),
            tagTextColor: Color(0xffB91C1C),
            subtitle: 'Petrol pump fill-up',
            time: '1:45 PM',
            amount: '₹650',
          ),
          const _ExpenseCard(
            icon: Icons.toll,
            title: 'Toll',
            tag: 'toll',
            tagColor: Color(0xffDBEAFE),
            tagTextColor: Color(0xff1D4ED8),
            subtitle: 'DND Flyway toll plaza',
            time: '4:20 PM',
            amount: '₹120',
          ),
          const _ExpenseCard(
            icon: Icons.local_parking,
            title: 'Parking',
            tag: 'parking',
            tagColor: Color(0xffDCFCE7),
            tagTextColor: Color(0xff15803D),
            subtitle: 'Airport pickup parking fees',
            time: '5:30 PM',
            amount: '₹200',
          ),
          const _ExpenseCard(
            icon: Icons.credit_card,
            title: 'Fastag',
            tag: 'fastag',
            tagColor: Color(0xffF3E8FF),
            tagTextColor: Color(0xff6B21A8),
            subtitle: 'NH-48 FASTag auto-debit',
            time: '2:15 PM',
            amount: '₹85',
          ),
        ],
      ),
    );
  }
}

class _AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        children: [
          _SectionCard(
            title: 'Expense Analytics',
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffE0EAFF),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Icon(Icons.trending_up, color: Color(0xff2563EB), size: 32),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Expense tracking helps you monitor your driving costs\n'
                  'and maximize earnings',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff475467), fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Expanded(
                      child: _InsightCard(
                        title: 'Avg per Duty',
                        value: '₹211',
                        background: Color(0xffEFF6FF),
                        borderColor: Color(0xffBFDBFE),
                        valueColor: Color(0xff1D4ED8),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _InsightCard(
                        title: 'Profit Margin',
                        value: '0%',
                        background: Color(0xffF0FDF4),
                        borderColor: Color(0xffBBF7D0),
                        valueColor: Color(0xff15803D),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.valueColor,
  });

  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff667085),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  const _BreakdownRow({
    required this.icon,
    required this.label,
    required this.amount,
    required this.percentage,
  });

  final IconData icon;
  final String label;
  final String amount;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xff3C4B69), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2937),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                percentage,
                style: const TextStyle(color: Color(0xff667085)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExpenseItem extends StatelessWidget {
  const _ExpenseItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.amount,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xff3C4B69), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Color(0xff475467)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    time,
                    style: const TextStyle(color: Color(0xff667085)),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffDC2626),
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Divider(height: 24),
      ],
    );
  }
}

class _FilterField extends StatelessWidget {
  const _FilterField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff344054),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xffF3F4F6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xff111827),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.expand_more, color: Color(0xff667085)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpenseCard extends StatelessWidget {
  const _ExpenseCard({
    required this.icon,
    required this.title,
    required this.tag,
    required this.tagColor,
    required this.tagTextColor,
    required this.subtitle,
    required this.time,
    required this.amount,
  });

  final IconData icon;
  final String title;
  final String tag;
  final Color tagColor;
  final Color tagTextColor;
  final String subtitle;
  final String time;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xff3C4B69), size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff111827),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: tagColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: tagTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xff475467)),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: Color(0xff667085)),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffDC2626),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.title,
    required this.value,
    required this.background,
    required this.borderColor,
    required this.valueColor,
  });

  final String title;
  final String value;
  final Color background;
  final Color borderColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
