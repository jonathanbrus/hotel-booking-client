import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyModal extends StatefulWidget {
  const OtpVerifyModal({Key? key}) : super(key: key);

  @override
  _OtpVerifyModalState createState() => _OtpVerifyModalState();
}

class _OtpVerifyModalState extends State<OtpVerifyModal> {
  String _code = "";

  void setCode(String code) {
    setState(() {
      _code = code;
    });
  }

  void verifyOtp() async {
    if (_code.isEmpty || _code.length < 6) {
      return;
    }

    try {
      if (mounted) {
        Navigator.pop(context, true);
      }
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

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        padding:
            const EdgeInsets.only(left: 12, top: 22, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Enter OTP To Verify",
              style: TextStyle(
                color: Colors.black87,
                fontSize: width * 0.044,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "The OTP code sent will be valid for 2 minutes.",
              style: TextStyle(
                color: Colors.black45,
                fontSize: width * 0.036,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: setCode,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    activeColor: Theme.of(context).colorScheme.primary,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    inactiveColor: Colors.grey,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: verifyOtp,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text("Verify"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<dynamic> showOtpVerifyModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    builder: (context) => const OtpVerifyModal(),
  );
}
