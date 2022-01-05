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
        title: Row(
          children: const [
            Icon(Icons.lock),
            SizedBox(width: 5),
            Text("maisamayhoon"),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(
                Icons.arrow_downward,
                size: 14,
                color: secondaryColor,
              ),
            ),
          ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile2.jpg'),
                ),
              ),
              Column(
                children: [
                  Text(
                    '123',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '770k',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Followers'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '972',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Following'),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15),
            child: Text(
              "Samay Raina",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15),
            child: Text(
              "Comedian",
              style: TextStyle(fontSize: 16, color: secondaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15),
            child: Text(
              "I was a comedian till someone ate a bat in.bookmyshow.com/eehfkjdhjdshjkdshf",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/story2.jpg'),
                      ),
                      left: 40,
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/story1.jpg'),
                      ),
                      left: 20,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/profile1.jpg'),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 8),
                    child: Text(
                      "Followed by munawar.faruqui, thesuhanishah and 76 others",
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white38),
                      ),
                      elevation: 0.0,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white38),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () {},
                    child: Text('▼'),
                  ),
                ),
              ],
            ),
            /* Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white38),
                    ),
                    elevation: 0.0,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Following ▼",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white38),
                    ),
                    elevation: 0.0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Message',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white38),
                    ),
                    elevation: 0.0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white38),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () {},
                    child: Text('▼')),
              ],
            ), */
          ),
        ],
      ),
    );
  }
}
