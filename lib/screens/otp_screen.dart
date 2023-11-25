import 'dart:async';

import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key) {
    _startCountdown();
  }

  static const String routeName = '/otp';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => OTPScreen(),
        settings: const RouteSettings(name: routeName));
  }

  final StreamController<int> _controller = StreamController<int>();
  int countdown = 60;

  void _startCountdown() async {
    for (int i = countdown; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      _controller.add(i);
    }
  }

  Future<void> _resendOtp() async {
    // Simulate sending OTP and waiting for 60 seconds
    await Future.delayed(const Duration(seconds: 60));
    _controller.add(60); // Reset countdown
    _startCountdown(); // Start countdown again
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: largePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OTP Verification',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: largePadding),
              Text(
                'Enter the verification code we just sent on your phone number.',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 72,
              ),
              Center(child: buildPinput()),
              const SizedBox(
                height: 64,
              ),
              CustomElevatedButton(
                  title: 'Verify',
                  onPressed: () {
                    Navigator.pushNamed(context, '/reset');
                  }),
              const SizedBox(
                height: 48,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StreamBuilder<int>(
                      stream: _controller.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          return Text(
                            'Resend OTP in ${snapshot.data}s',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    TextButton(
                      onPressed: countdown == 60 ? _resendOtp : null,
                      child: const Text('Resend OTP'),
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

  Widget buildPinput() {
    final defaultPinTheme = PinTheme(
      width: 68,
      height: 68,
      textStyle: const TextStyle(
          fontSize: 20, color: primaryColor, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: const Color.fromRGBO(234, 239, 243, 1), width: 1),
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: primaryColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
