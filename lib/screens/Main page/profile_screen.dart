import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/bloc/personal_information_bloc/personal_information_bloc.dart';
import '../../utils/screen_size_extension.dart';
import './Profile pages/user_subscription.dart';
import './Profile pages/personal_information.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int pageIndex = 0;

  final List<Widget> _screens = [
    const UserSubscription(),
    PersonalInformation(),
  ];

  void _onNavBarItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInformationBloc()..add(GetUserByIdEvent()),
      child: BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
        builder: (context, state) {
          if (state is SuccessfullyPersonalInformationState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                  context.heightPercent(90.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.widthPercent(20.0),
                  ),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leadingWidth: context.widthPercent(105.0),
                    titleSpacing: 0.0,
                    automaticallyImplyLeading: false,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                        Text(
                          "Hello, ${state.data.name}!",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SettingsPage');
                        },
                        icon: SvgPicture.asset(
                            'assets/icons/carbon_settings.svg'),
                      )
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(
                        context.heightPercent(35.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _NavBarItem(
                            label: "My subscription",
                            onTap: () => _onNavBarItemTapped(0),
                            isTapped: pageIndex == 0,
                          ),
                          _NavBarItem(
                            label: "Personal information",
                            onTap: () => _onNavBarItemTapped(1),
                            isTapped: pageIndex == 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: context.heightPercent(20.0),
                  ),
                  Expanded(
                    child: _screens[pageIndex],
                  ),
                ],
              ),
            );
          }

          if (state is LoadingPersonalInformationState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffF1C40F),
              ),
            );
          }

          if (state is ErrorPersonalInformationState) {
            return Center(
              child: Text(
                "Ошибка при получении сервиса: ${state.errorMessage}",
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isTapped;
  const _NavBarItem({
    required this.label,
    required this.onTap,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    final Color navBarItemBorderColor =
        isTapped ? const Color(0xff3498DB) : Colors.transparent;

    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: navBarItemBorderColor, width: 1.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthPercent(8.0),
              vertical: context.heightPercent(4.0),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
