import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/providers/pageview_provider.dart';
import 'package:instagram_clone/screens/camera_screen.dart';
import 'package:instagram_clone/screens/chat_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

class PageViewCameraFeedChat extends ConsumerWidget {
  const PageViewCameraFeedChat({
    Key? key,
  }) : super(key: key);

  Future<CameraDescription> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    return firstCamera;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(pageviewProvider);
    final PageController _pageController = PageController(initialPage: index);
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
