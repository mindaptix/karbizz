import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1C2D5D),
              Color(0xff1B2552),
              Color(0xff2A355F),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isCompact = constraints.maxHeight < 720;
              final bool isTiny = constraints.maxHeight < 640;
              final double scale = isTiny ? 0.82 : (isCompact ? 0.92 : 1.0);
              double scaled(double value) => value * scale;
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: scaled(20)),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: scaled(16)),
                            Container(
                              padding: EdgeInsets.all(scaled(12)),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 18,
                                    offset: Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/logo.png",
                                width: scaled(58),
                              ),
                            ),
                            SizedBox(height: scaled(12)),
                            Text(
                              "Karbizz Pro",
                              style: TextStyle(
                                fontSize: scaled(22),
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: scaled(4)),
                            Text(
                              "CORPORATE CAR RENTAL",
                              style: TextStyle(
                                fontSize: scaled(11),
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffF4B740),
                              ),
                            ),
                            SizedBox(height: scaled(16)),
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: scaled(26),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: scaled(4)),
                            Text(
                              "Sign in to continue",
                              style: TextStyle(
                                fontSize: scaled(13),
                                color: Color(0xffF4B740),
                              ),
                            ),
                            SizedBox(height: scaled(18)),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: scaled(14),
                                vertical: scaled(16),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffF7F7FA),
                                borderRadius: BorderRadius.circular(scaled(26)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(scaled(4)),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE6ECF8),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: scaled(8),
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff1E2B46),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Driver Login",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: scaled(13),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Passenger Login",
                                              style: TextStyle(
                                                color: const Color(0xff1E2B46),
                                                fontWeight: FontWeight.w600,
                                                fontSize: scaled(13),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: scaled(16)),
                                  Container(
                                    height: scaled(56),
                                    width: scaled(56),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff37435D),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                      size: scaled(28),
                                    ),
                                  ),
                                  SizedBox(height: scaled(12)),
                                  Text(
                                    "Driver Login",
                                    style: TextStyle(
                                      fontSize: scaled(16),
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff1E2B46),
                                    ),
                                  ),
                                  SizedBox(height: scaled(6)),
                                  Text(
                                    "Enter your registered phone number",
                                    style: TextStyle(
                                      color: Color(0xff64748B),
                                      fontSize: scaled(12),
                                    ),
                                  ),
                                  SizedBox(height: scaled(14)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff1E2B46),
                                        fontSize: scaled(12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: scaled(6)),
                                  TextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "+91 98765 43210",
                                      prefixIcon: const Icon(
                                        Icons.phone_in_talk_outlined,
                                        color: Color(0xff64748B),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: scaled(14)),
                                  SizedBox(
                                    width: double.infinity,
                                    height: scaled(46),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff2C3957),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                      ),
                                      onPressed: () {
                                        debugPrint("LOGIN -> OTP");
                                        Navigator.of(context)
                                            .pushNamed(Routes.otp);
                                      },
                                      child: Text(
                                        "Send OTP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: scaled(14),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: scaled(18)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _FeatureItem(
                                  icon: Icons.verified_user_outlined,
                                  label: "Secure\nAuthentication",
                                  isCompact: isCompact || isTiny,
                                ),
                                _FeatureItem(
                                  icon: Icons.star_outline,
                                  label: "Professional\nService",
                                  isCompact: isCompact || isTiny,
                                ),
                                _FeatureItem(
                                  icon: Icons.verified_outlined,
                                  label: "Quick\nAccess",
                                  isCompact: isCompact || isTiny,
                                ),
                              ],
                            ),
                            SizedBox(height: scaled(12)),
                            Text(
                              "By continuing, you agree to our Terms of Service & Privacy Policy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffB2B9C9),
                                fontSize: scaled(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.icon,
    required this.label,
    required this.isCompact,
  });

  final IconData icon;
  final String label;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: isCompact ? 40 : 48,
          width: isCompact ? 40 : 48,
          decoration: BoxDecoration(
            color: const Color(0xff2B3859),
            borderRadius: BorderRadius.circular(isCompact ? 20 : 24),
          ),
          child: Icon(
            icon,
            color: const Color(0xffF4B740),
            size: isCompact ? 18 : 22,
          ),
        ),
        SizedBox(height: isCompact ? 6 : 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: isCompact ? 10 : 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
