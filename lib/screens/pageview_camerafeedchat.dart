import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/pageview_camerafeedchat_provider.dart';
import 'package:instagram_clone/screens/camera_screen.dart';
import 'package:instagram_clone/screens/chat_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:provider/provider.dart';

class PageViewCameraFeedChat extends StatelessWidget {
  const PageViewCameraFeedChat({
    Key? key,
  }) : super(key: key);

  Future<CameraDescription> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    return firstCamera;
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        Provider.of<PageViewProvider>(context).getNavbarPageController;
    return PageView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        FutureBuilder(
          future: initCamera(),
          builder: (context, AsyncSnapshot<CameraDescription> snapshot) {
            if (snapshot.hasData) {
              return CameraScreen(camera: snapshot.data!);
            } else if (snapshot.hasError) {
              return const Text('err');
            } else {
              return const ColoredBox(
                color: Colors.yellow,
              );
            }
          },
        ),
        const FeedScreen(),
        const ChatScreen(),
      ],
    );
  }
}
