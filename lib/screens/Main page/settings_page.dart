import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/bloc/logout_bloc/logout_bloc.dart';
import '../../utils/screen_size_extension.dart';
import '../../presentation/settings_options.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout(BuildContext context) {
      context.read<LogoutBloc>().add(LoggingOutEvent());
    }

    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is SuccessfullyLogout) {
          Navigator.pushReplacementNamed(context, '/SignIn');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.heightPercent(40.0)),
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/avatar.png",
                    width: context.widthPercent(40.0),
                    height: context.heightPercent(40.0),
                  ),
                ),
                const Text(
                  "Hello, Name!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(20.0),
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.heightPercent(30.0),
              ),
              SettingsOptions(
                label: "General",
                onTap: () {
                  Navigator.pushNamed(context, "/SettingsPage/GeneralPage");
                },
              ),
              SettingsOptions(
                label: "Избранное",
                onTap: () {
                  Navigator.pushNamed(context, '/SettingsPage/FavoritesPage');
                },
              ),
              SettingsOptions(
                label: "Subscriptions",
                onTap: () {
                  Navigator.pushNamed(
                      context, '/SettingsPage/UserSubsription');
                },
              ),
              SettingsOptions(
                label: "Payment methods",
                onTap: () {
                  Navigator.pushNamed(
                      context, '/SettingsPage/PaymentsMethods');
                },
              ),
              SettingsOptions(
                label: "Manage addresses",
                onTap: () {
                  Navigator.pushNamed(
                      context, "/SettingsPage/ManageAdresses");
                },
              ),
              SettingsOptions(
                label: "Payment history",
                onTap: () {
                  Navigator.pushNamed(
                      context, '/SettingsPage/GeneralPage/PaymentHistory');
                },
              ),
              SettingsOptions(label: "Help", onTap: () {}),
              SettingsOptions(
                label: "FAQ",
                onTap: () {
                  Navigator.pushNamed(context, '/SettingsPage/FAQPage');
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 60.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.black,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Exit",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Material(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => logout(context),
                      child: SvgPicture.asset(
                        "assets/icons/radix-icons_exit.svg",
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
