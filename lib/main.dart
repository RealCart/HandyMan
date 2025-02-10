import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/bloc/get_categories_bloc/get_categories_bloc.dart';
import 'package:handy_man/bloc/get_services_bloc/get_services_bloc.dart';
import 'package:handy_man/bloc/logged_in_bloc/logged_in_bloc.dart';
import 'package:handy_man/bloc/logout_bloc/logout_bloc.dart';
import 'package:handy_man/providers/bottom_bar_index.dart';
import 'package:handy_man/screens/Forgot%20password/new_password.dart';
import 'package:handy_man/screens/Settings%20page/language_page.dart';
import 'package:handy_man/screens/Settings%20page/manage_adresses.dart';
import 'package:handy_man/screens/Settings%20page/payment_history.dart';
import 'package:handy_man/screens/Settings%20page/payments_methods.dart';
import 'package:handy_man/screens/sign_up.dart';
import 'package:handy_man/service_locator.dart';
import 'screens/login.dart';
import 'screens/Forgot password/forgot_password.dart';
import 'screens/Forgot password/reset_code.dart';
import 'screens/Forgot password/password_changed.dart';
import './navigation/main_navigation.dart';
import './screens/Main page/settings_page.dart';
import './screens/Settings page/general_page.dart';
import './screens/Settings page/favorites_page.dart';
import './screens/Settings page/subscription_page.dart';
import './screens/Settings page/faq_page.dart';
import 'package:provider/provider.dart';

void main() {
  setupServiceLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GetCategoriesBloc>(
        create: (context) => GetCategoriesBloc()..add(GetCategoriesEvent()),
      ),
      BlocProvider<GetServicesBloc>(
        create: (context) => GetServicesBloc()..add(GetServicesCategoryEvent()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarIndex()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoggedInBloc()..add(IsLoggedInEvent()),
          ),
          BlocProvider(
            create: (context) => LogoutBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<LoggedInBloc, LoggedInState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const MainNavigation();
              }

              if (state is UnAuthenticated) {
                return LoginPage();
              }
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            },
          ),
          routes: {
            '/SignIn': (context) => LoginPage(),
            '/SignUp': (context) => SignUp(),
            '/ResetCode': (context) => const ResetCode(),
            '/NewPassword': (context) => NewPassword(),
            '/ForgotPassword': (context) => ForgotPassword(),
            '/PasswordChanged': (context) => const PasswordChangedPage(),
            '/MainNavigation': (context) => const MainNavigation(),
            '/SettingsPage': (context) => const SettingsPage(),
            '/SettingsPage/GeneralPage': (context) => const GeneralPage(),
            '/SettingsPage/FavoritesPage': (context) => const FavoritesPage(),
            '/SettingsPage/UserSubsription': (context) =>
                const SubscriptionPage(),
            '/SettingsPage/FAQPage': (context) => const FAQPage(),
            '/SettingsPage/PaymentsMethods': (context) =>
                const PaymentsMethods(),
            '/SettingsPage/ManageAdresses': (context) => const ManageAdresses(),
            '/SettingsPage/GeneralPage/LanguagePage': (context) =>
                const LanguagePage(),
            '/SettingsPage/GeneralPage/PaymentHistory': (context) =>
                const PaymentHistory()
          },
        ),
      ),
    );
  }
}
