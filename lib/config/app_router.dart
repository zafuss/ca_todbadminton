import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case SearchScreen.routeName:
        return SearchScreen.route();
      case MainScreen.routeName:
        return MainScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case ForgotPasswordScreen.routeName:
        return ForgotPasswordScreen.route();
      case ResetPasswordScreen.routeName:
        return ResetPasswordScreen.route();
      case OTPScreen.routeName:
        return OTPScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      // case SplashScreen.routeName:
      //   return SplashScreen.route();
      // case HomeScreen.routeName:
      //   return HomeScreen.route();
      // case CartScreen.routeName:
      //   return CartScreen.route();
      // case CatalogScreen.routeName:
      //   return CatalogScreen.route(category: settings.arguments as Category);
      // case ProductScreen.routeName:
      //   return ProductScreen.route(product: settings.arguments as Product);
      // case WishlistScreen.routeName:
      //   return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
            ),
        settings: const RouteSettings(name: "/error"));
  }
}
