import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/reset';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
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
                'Reset Password',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: largePadding),
              Text(
                'Enter your new password twice below to reset a new password.',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 64,
              ),
              Text('Enter new password',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: '', isPassword: true),
              const SizedBox(
                height: minPadding,
              ),
              Text('Re-enter new password',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: '', isPassword: true),
              const SizedBox(
                height: minPadding * 2,
              ),
              CustomElevatedButton(
                title: 'Reset Password',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
