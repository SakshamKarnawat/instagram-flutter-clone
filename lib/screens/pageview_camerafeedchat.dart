import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/pageview_camerafeedchat_provider.dart';
import 'package:instagram_clone/screens/camera_screen.dart';
import 'package:instagram_clone/screens/chat_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:provider/provider.dart';

class PageViewCameraFeedChat extends StatelessWidget {
  const PageViewCameraFeedChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        Provider.of<PageViewProvider>(context).getNavbarPageController;
    return PageView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: const [
        CameraScreen(),
        FeedScreen(),
        ChatScreen(),
      ],
    );
  }
}
