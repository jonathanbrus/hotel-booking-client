import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

import '../widgets/otp_verify_modal.dart';

class VerifyOtp extends StatefulWidget {
  static const routeName = "/verify-otp";

  const VerifyOtp({Key? key}) : super(key: key);

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String _phone = "";

  void setPhone(phone) {
    setState(() {
      _phone = phone;
    });
  }

  bool sendOtp() {
    return true;
  }

  void handleSend() async {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    if (_phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Enter proper 10 digit phone number."),
        ),
      );

      return;
    }

    try {
      final sent = sendOtp();
      if (!sent) {
        return;
      }

      final verified = await showOtpVerifyModal(context);

      if (verified == null) {
        return;
      }

      Provider.of<AuthProvider>(context, listen: false).setStatus(
        AuthStatus.aunthenticated,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: const Text(
                      "+91",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: TextField(
                        onChanged: setPhone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Phone Number",
                          hintStyle: TextStyle(
                            fontSize: width * 0.042,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: width * 0.042,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: handleSend,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
