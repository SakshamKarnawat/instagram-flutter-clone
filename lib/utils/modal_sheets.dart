import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

void reelsModalSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: mobileBackgroundColor,
    isScrollControlled: true,
    constraints: const BoxConstraints(
      minHeight: 0,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.horizontal_rule_outlined,
              size: 30,
              color: secondaryColor,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/bookmark_icon.svg',
              color: primaryColor,
            ),
            title: const Text('Saved Reels'),
          ),
          const ListTile(
            leading: Icon(Icons.multitrack_audio),
            title: Text('Saved Audio'),
          ),
          const ListTile(
            leading: Icon(Icons.star_sharp),
            title: Text('Saved effects'),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/heart_icon.svg',
                color: primaryColor),
            title: const Text('Liked reels'),
          ),
        ],
      );
    },
  );
}

void profileModalSheet(BuildContext context) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: Colors.grey[900],
    isScrollControlled: true,
    constraints: const BoxConstraints(
      minHeight: 0,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 40,
              child: Divider(
                color: Colors.white54,
                thickness: 3,
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              Icons.settings,
              color: primaryColor,
            ),
            horizontalTitleGap: 12,
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              Icons.history,
              color: primaryColor,
            ),
            horizontalTitleGap: 12,
            title: const Text('Archive'),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              Icons.more_time,
              color: primaryColor,
            ),
            horizontalTitleGap: 12,
            title: const Text('Your Activity'),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              Icons.qr_code_2_outlined,
              color: primaryColor,
            ),
            horizontalTitleGap: 12,
            title: const Text('QR Code'),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: SvgPicture.asset(
              'assets/images/bookmark_icon.svg',
              color: primaryColor,
            ),
            horizontalTitleGap: 12,
            title: const Text('Saved'),
            onTap: () {},
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              Icons.format_list_bulleted,
              color: primaryColor,
            ),
            horizontalTitleGap: 12,
            title: const Text('Close Friends'),
            onTap: () {},
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.white12,
            splashFactory: InkSplash.splashFactory,
            child: ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.health_and_safety_outlined,
                color: primaryColor,
              ),
              horizontalTitleGap: 12,
              title: const Text('COVID-19 Information Center'),
              selectedColor: Colors.blue,
              selectedTileColor: Colors.amber,
              hoverColor: Colors.green,
              focusColor: Colors.red,
            ),
          ),
        ],
      );
    },
  );
}
