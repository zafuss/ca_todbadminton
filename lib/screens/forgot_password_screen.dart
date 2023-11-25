import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/forgot';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const ForgotPasswordScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/register');
        },
        child: SizedBox(
          height: largePadding * 3,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Create an account',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: primaryColor),
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: largePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: largePadding),
              Text(
                'Enter your email address to get the password reset link.',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 64,
              ),
              Text('Email Address',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: 'hello@example.com'),
              const SizedBox(
                height: minPadding * 2,
              ),
              CustomElevatedButton(
                title: 'Password Reset',
                onPressed: () {
                  Navigator.pushNamed(context, '/otp');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
