import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OTPAutoPage extends StatefulWidget {
  const OTPAutoPage({Key? key}) : super(key: key);

  @override
  State<OTPAutoPage> createState() => _OTPAutoPageState();
}

class _OTPAutoPageState extends State<OTPAutoPage> {
  List<TextEditingController> otpControllers = [];
  bool isOTPFilled = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      otpControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _checkOTP() {
    String otp = '';
    for (var controller in otpControllers) {
      otp += controller.text;
    }

    // Replace this logic with your own OTP validation logic
    if (otp == '1234') {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NextPage()),
      );
    } else {
      // Invalid OTP, show error or perform any required action
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid OTP'),
            content: Text('Please enter a valid OTP.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < 4; i++)
                  SizedBox(
                    width: 50.0,
                    child: TextField(
                      controller: otpControllers[i],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (i < 3) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            _checkOTP();
                          }
                        }
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('OTP verified successfully!'),
      ),
    );
  }
}