import 'package:flutter/material.dart';
import 'package:handy_man/presentation/like_widget.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 330.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/house_service_bg.png",
          fit: BoxFit.cover,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: LikeWidget(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
