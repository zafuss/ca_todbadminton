import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: SizedBox(
          height: largePadding * 3,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(85, 85, 85, 1)),
                ),
                Text(
                  'Sign in.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: largePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 78,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Phone Number',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: 'Your Phone Number'),
              const SizedBox(
                height: minPadding,
              ),
              Text('Email', style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: 'Email'),
              const SizedBox(
                height: minPadding,
              ),
              Text('Password',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: 'Password'),
              const SizedBox(
                height: minPadding,
              ),
              Text('Repeat Password',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: 'Repeat Password'),
              const SizedBox(
                height: largePadding,
              ),
              CustomElevatedButton(
                title: 'Register',
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
