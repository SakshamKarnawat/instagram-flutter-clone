import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/providers/pageview_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/profile_listtile.dart';
import 'package:instagram_clone/widgets/search_bar.dart';
import 'package:instagram_clone/widgets/showcase_alert.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          foregroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
            onPressed: () {
              ref.read(pageviewProvider.notifier).value = 1;
            },
          ),
          leadingWidth: 50,
          title: Row(
            children: [
              const Flexible(
                fit: FlexFit.loose,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 3.0, right: 8),
                    child: Text(
                      'saksham_227',
                      style: TextStyle(fontSize: 20),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    )),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  'assets/images/down_arrow_icon.svg',
                  color: Colors.white,
                  width: 12,
                  height: 12,
                ),
              ),
            ],
          ),
          actions: [
            SvgPicture.asset('assets/images/videocam1.svg',
                color: Colors.white, width: 28, height: 28),
            const SizedBox(width: 15),
            const Icon(Icons.add, size: 30),
            const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchBar(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10.0),
                    child: TextButton(
                      onPressed: () => const ShowCaseAlert(),
                      child: const Text(
                        'Requests',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ...chatList,
            ],
          ),
        ),
      ),
    );
  }
}

const List<ProfileListTile> chatList = [
  ProfileListTile(
    profilePicURL: "assets/images/profile1.jpg",
    name: "First chat",
    msg: "Hey! Long time no see!",
    timeAgo: "7h",
    isSeen: true,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
  ProfileListTile(
    profilePicURL: "assets/images/profile2.jpg",
    name: "Samay Raina",
    msg: "Hi bhai kaisa hai?",
    timeAgo: "2d",
    isSeen: false,
    hasStories: false,
    allStoriesViewed: false,
  ),
];
