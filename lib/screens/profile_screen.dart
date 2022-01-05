import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/modal_sheets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/images/ic_instagram.svg',
          // height: 75,
          width: 120,
          color: primaryColor,
          fit: BoxFit.cover,
        ),
        titleSpacing: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              'assets/images/add_icon.svg',
              height: 28,
              width: 28,
              color: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.menu_sharp),
              iconSize: 28,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => profileModalSheet(context),
            ),
          ),
        ],
      ),
    );
  }
}
