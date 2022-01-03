import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/providers/navbar_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with AutomaticKeepAliveClientMixin<FeedScreen> {
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
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  'assets/images/chat_icon.svg',
                  height: 28,
                  width: 28,
                  color: primaryColor,
                ),
              ),
              Positioned(
                right: 1,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('3', style: TextStyle(color: primaryColor)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Stories:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  UserStories(
                    username: 'Your Story',
                    profilePicURL: 'assets/images/profile1.jpg',
                    viewedAll: true,
                  ),
                  UserStories(
                    username: 'saksham_227',
                    profilePicURL: 'assets/images/mystory.jpg',
                    viewedAll: true,
                  ),
                  UserStories(
                    username: 'karansinghmagic',
                    profilePicURL: 'assets/images/story2.jpg',
                    viewedAll: false,
                  ),
                  UserStories(
                    username: 'samayraina',
                    profilePicURL: 'assets/images/profile2.jpg',
                    viewedAll: false,
                  ),
                  UserStories(
                    username: 'fcbarcelona',
                    profilePicURL: 'assets/images/profile3.jpg',
                    viewedAll: false,
                  ),
                  UserStories(
                    username: 'b',
                    profilePicURL: 'assets/images/mystory.jpg',
                    viewedAll: true,
                  ),
                  UserStories(
                    username: 'c',
                    profilePicURL: 'assets/images/story2.jpg',
                    viewedAll: true,
                  ),
                ],
              ),
            ),
            //Divider:
            const Divider(),
            //Posts:
            Column(
              children: const [
                UserPost(
                  username: "karansinghmagic",
                  profilePicURL: "assets/images/story2.jpg",
                  areUserStoriesViewed: true,
                  noOfLikes: 2952,
                  noOfComments: 232,
                  timeAgo: "7 hours",
                  postURL: "assets/images/mystory.jpg",
                ),
                UserPost(
                  username: "virdas",
                  profilePicURL: "assets/images/story1.jpg",
                  areUserStoriesViewed: true,
                  noOfLikes: 4643,
                  noOfComments: 892,
                  timeAgo: "4 hours",
                  postURL: "assets/images/mystory.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserStories extends StatelessWidget {
  final String username;
  final String profilePicURL;
  final bool viewedAll;
  const UserStories(
      {Key? key,
      required this.username,
      required this.profilePicURL,
      required this.viewedAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: username == "Your Story"
          ? const EdgeInsets.only(left: 10)
          : const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // gradient: LinearGradient(
              //     colors: [
              //       Colors.blue,
              //       Colors.red,
              //     ],
              //   ),
              border: Border.all(
                color: viewedAll ? Colors.white24 : blueColor,
                width: 2,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: mobileBackgroundColor,
                  width: 3,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white12,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 35,
                  child: ClipOval(
                    child: Image.asset(
                      profilePicURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              username,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class UserPost extends StatelessWidget {
  final String username;
  final String profilePicURL;
  final bool areUserStoriesViewed;
  final int noOfLikes;
  final int noOfComments;
  final String timeAgo;
  final String postURL;

  const UserPost({
    required this.username,
    required this.profilePicURL,
    required this.areUserStoriesViewed,
    required this.noOfLikes,
    required this.noOfComments,
    required this.timeAgo,
    required this.postURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 5,
      ),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              areUserStoriesViewed
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: 22,
                        child: ClipOval(
                          child: Image.asset(
                            profilePicURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: mobileBackgroundColor,
                          child: CircleAvatar(
                            radius: 20,
                            child: ClipOval(
                              child: Image.asset(
                                profilePicURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          //Post:
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            height: 300,
            width: double.infinity,
            child: Image.asset(
              postURL,
              color: Colors.white,
              fit: BoxFit.fill,
            ),
          ),
          //
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.favorite_outline,
                  size: 28,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/comment_icon.svg',
                  height: 24,
                  width: 24,
                  color: primaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/send_in_dm_icon.svg',
                  height: 24,
                  width: 24,
                  color: primaryColor,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/bookmark_icon.svg',
                  height: 24,
                  width: 24,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "$noOfLikes likes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "View all $noOfComments comments",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  radius: 16,
                  child: ClipOval(
                    child: Image.asset(
                      profilePicURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Text(
                "Add a comment...",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/heart_filled_small.svg',
                  height: 16,
                  width: 16,
                  // color: Colors.red,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("🙌"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 16,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "$timeAgo ago",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
