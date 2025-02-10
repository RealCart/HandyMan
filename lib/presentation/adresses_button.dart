import 'package:flutter/material.dart';
import 'package:handy_man/models/user_adresses.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdressesButton extends StatelessWidget {
  const AdressesButton({
    super.key,
    required this.adresses,
  });

  final UserAdresses adresses;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 13.0,
          right: 20.0,
          bottom: 14.0,
          left: 17.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${adresses.city} city, ${adresses.street} ${adresses.houseNumber}',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/adress_garbage_icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
