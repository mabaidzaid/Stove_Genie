import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class NotificationIcon extends StatelessWidget {
  final bool? showBadge;

  const NotificationIcon({Key? key, this.showBadge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showBadge == true
            ? badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 0),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: const Color(0xFFFF9C00),
                  elevation: 0,
                  shape: badges.BadgeShape.circle,
                ),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFE1B3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset('assets/icons/doc.svg'),
                  ),
                ),
              )
            : Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFE1B3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset('assets/icons/doc.svg'),
                ),
              ),
      ],
    );
  }
}
