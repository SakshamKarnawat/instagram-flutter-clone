import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/providers/pageview_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/user_post.dart';
import 'package:instagram_clone/widgets/user_stories.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen>
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
                child: GestureDetector(
                  onTap: () {
                    ref.read(pageviewProvider.notifier).value = 2;
                  },
                  child: SvgPicture.asset(
                    'assets/images/chat_icon.svg',
                    height: 28,
                    width: 28,
                    color: primaryColor,
                  ),
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
                children: userStories,
              ),
            ),
            //Divider:
            const Divider(),
            //Posts:
            Column(children: userposts),
          ],
        ),
      ),
    );
  }
}

const List<UserStories> userStories = [
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
];

const List<UserPost> userposts = [
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
];
