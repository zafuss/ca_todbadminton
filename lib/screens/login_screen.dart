import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/screens/screens.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
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
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: minPadding / 2,
              ),
              Text(
                'Welcome back to the app',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Phone Number',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      color: primaryColor,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: minPadding,
              ),
              Text('Phone Number',
                  style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(context: context, title: 'Your Phone Number'),
              const SizedBox(
                height: minPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Password',
                      style: Theme.of(context).textTheme.headlineSmall!),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: minPadding,
              ),
              CustomTFF(
                context: context,
                title: 'Password',
                isPassword: true,
              ),
              const SizedBox(
                height: minPadding,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                },
                child: Row(
                  children: [
                    rememberMe
                        ? const Icon(
                            Icons.check_box_outlined,
                            color: primaryColor,
                          )
                        : const Icon(
                            Icons.check_box_outline_blank,
                            color: primaryColor,
                          ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Keep me sign in',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largePadding,
              ),
              CustomElevatedButton(
                title: 'Login',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      HomeScreen.routeName, (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
