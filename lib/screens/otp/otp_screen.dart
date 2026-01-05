import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D2F6F),
              Color(0xff0E1B3D),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isCompact = constraints.maxHeight < 720;
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: isCompact ? 8 : 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: isCompact ? 6 : 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(isCompact ? 6 : 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Image.asset(
                                  "assets/logo.png",
                                  width: isCompact ? 34 : 48,
                                ),
                              ),
                              SizedBox(width: isCompact ? 6 : 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Karbizz Pro",
                                    style: TextStyle(
                                      fontSize: isCompact ? 16 : 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: isCompact ? 2 : 4),
                                  Text(
                                    "CORPORATE CAR RENTAL",
                                    style: TextStyle(
                                      fontSize: isCompact ? 9 : 12,
                                      letterSpacing: isCompact ? 1.1 : 1.4,
                                      color: Color(0xffF4C23C),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: isCompact ? 10 : 24),
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: isCompact ? 20 : 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: isCompact ? 2 : 6),
                          Text(
                            "Sign in to continue",
                            style: TextStyle(
                              fontSize: isCompact ? 11 : 14,
                              color: Color(0xffF4C23C),
                            ),
                          ),
                          SizedBox(height: isCompact ? 12 : 24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffF7F7F7),
                              borderRadius: BorderRadius.circular(isCompact ? 20 : 24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 24,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(isCompact ? 4 : 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: isCompact ? 8 : 10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff1A2D5C),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                            "Driver Login",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: isCompact ? 11 : 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: isCompact ? 8 : 12),
                                      Expanded(
                                        child: Text(
                                          "Passenger Login",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1A2D5C),
                                            fontWeight: FontWeight.w600,
                                            fontSize: isCompact ? 11 : 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: isCompact ? 12 : 24),
                                Container(
                                  width: isCompact ? 50 : 70,
                                  height: isCompact ? 50 : 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xff1EC16B),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: isCompact ? 22 : 32,
                                  ),
                                ),
                                SizedBox(height: isCompact ? 8 : 16),
                                Text(
                                  "Verify OTP",
                                  style: TextStyle(
                                    fontSize: isCompact ? 16 : 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff2A3348),
                                  ),
                                ),
                                SizedBox(height: isCompact ? 4 : 8),
                                Text(
                                  "We've sent a 6-digit OTP to\n9464506199",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isCompact ? 11 : 14,
                                    color: Color(0xff4B556B),
                                  ),
                                ),
                                SizedBox(height: isCompact ? 10 : 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Enter OTP",
                                    style: TextStyle(
                                      fontSize: isCompact ? 11 : 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff2A3348),
                                    ),
                                  ),
                                ),
                                SizedBox(height: isCompact ? 6 : 10),
                                TextField(
                                  controller: otpController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isCompact ? 15 : 18,
                                    letterSpacing: isCompact ? 2 : 4,
                                    color: Color(0xff2A3348),
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "123456",
                                    hintStyle: TextStyle(
                                      color: Color(0xff9AA3B2),
                                      letterSpacing: isCompact ? 2 : 4,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                SizedBox(height: isCompact ? 10 : 16),
                                SizedBox(
                                  width: double.infinity,
                                  height: isCompact ? 44 : 52,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff8ED0A5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context)
                                          .pushReplacementNamed(Routes.home);
                                    },
                                    child: Text(
                                      "Verify & Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isCompact ? 13 : 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: isCompact ? 8 : 18),
                                Text.rich(
                                  TextSpan(
                                    text: "Didn't receive OTP? ",
                                    style: TextStyle(
                                      color: Color(0xff6B7280),
                                      fontSize: isCompact ? 11 : 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Resend",
                                        style: TextStyle(
                                          color: Color(0xffF28C1B),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (!isCompact)
                        Column(
                          children: [
                            SizedBox(height: isCompact ? 14 : 22),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _FeatureItem(
                                  icon: Icons.security,
                                  label: "Secure\nAuthentication",
                                  isCompact: isCompact,
                                ),
                                _FeatureItem(
                                  icon: Icons.star,
                                  label: "Professional Service",
                                  isCompact: isCompact,
                                ),
                                _FeatureItem(
                                  icon: Icons.flash_on,
                                  label: "Quick Access",
                                  isCompact: isCompact,
                                ),
                              ],
                            ),
                            SizedBox(height: isCompact ? 12 : 20),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: isCompact ? 12 : 24,
                              ),
                              child: Text(
                                "By continuing, you agree to our Terms of Service & Privacy Policy",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff9BA3B2),
                                  fontSize: isCompact ? 10 : 12,
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "By continuing, you agree to our Terms of Service & Privacy Policy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff9BA3B2),
                              fontSize: 10,
                            ),
                          ),
                        ),
                    ],
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
          width: isCompact ? 38 : 44,
          height: isCompact ? 38 : 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xffF4C23C),
            size: isCompact ? 18 : 22,
          ),
        ),
        SizedBox(height: isCompact ? 6 : 8),
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
