import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileListTile extends StatelessWidget {
  final String profilePicURL;
  final String name;
  final String msg;
  final String timeAgo;
  final bool isSeen;
  const ProfileListTile(
      {Key? key,
      required this.profilePicURL,
      required this.name,
      required this.msg,
      required this.timeAgo,
      required this.isSeen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      minLeadingWidth: 0,
      horizontalTitleGap: 8,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      leading: CircleAvatar(
          radius: 36,
          backgroundColor: Colors.amber,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(profilePicURL),
          )),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 17,
            fontWeight: isSeen ? FontWeight.normal : FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Flexible(
              child: Text(msg,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSeen ? FontWeight.normal : FontWeight.bold,
                  ))),
          Text(' · ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: isSeen ? FontWeight.normal : FontWeight.bold)),
          Text(timeAgo,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSeen ? FontWeight.normal : FontWeight.bold)),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 8),
        child: SvgPicture.asset(
          'assets/images/camera_icon.svg',
          color: Colors.white60,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
