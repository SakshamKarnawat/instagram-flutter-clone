import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<void> _onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Text(
            'Activity',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage('assets/images/profile3.jpg'),
                        ),
                        Positioned(
                          left: 30,
                          top: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text('49',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: primaryColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Follow Requests',
                          style: TextStyle(color: primaryColor),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Approve or ignore requests',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Today",
                  style: TextStyle(color: primaryColor, fontSize: 16),
                ),
                const SizedBox(height: 10),
                const ActivityTile(
                  isLiked: false,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "maisamayhoon",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "commented on your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "karansinghmagic",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
                const ActivityTile(
                  isLiked: true,
                  notificationText: "liked your post.",
                  profilePicURL: "assets/images/profile2.jpg",
                  postURL: "assets/images/story2.jpg",
                  username: "saksham_227 and 79 others",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityTile extends StatefulWidget {
  final String profilePicURL;
  final String notificationText;
  final bool isLiked;
  final String postURL;
  final String username;
  const ActivityTile(
      {Key? key,
      required this.profilePicURL,
      required this.notificationText,
      required this.isLiked,
      required this.postURL,
      required this.username})
      : super(key: key);

  @override
  State<ActivityTile> createState() => _ActivityTileState();
}

class _ActivityTileState extends State<ActivityTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  // bool isLikeda = widget.isLiked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(widget.profilePicURL),
          ),
          horizontalTitleGap: 14,
          title: Wrap(
            children: [
              Text(
                "${widget.username} ",
                overflow: TextOverflow.clip,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.notificationText,
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          trailing: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(widget.postURL, height: 50, width: 50),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 60),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // _widget.is
                  });
                },
                child: SvgPicture.asset(
                  widget.isLiked
                      ? 'assets/images/heart_filled_small.svg'
                      : 'assets/images/heart_icon_small.svg',
                  height: 12,
                  width: 12,
                ),
              ),
              const SizedBox(width: 24),
              const Text('Reply')
            ],
          ),
        ),
      ],
    );
  }
}
