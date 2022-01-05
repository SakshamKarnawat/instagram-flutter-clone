import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();

    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController..play()),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Reels',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/camera_icon.svg',
                        color: primaryColor,
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          Icons.menu_sharp,
                          size: 32,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: mobileBackgroundColor,
                            isScrollControlled: true,
                            constraints: const BoxConstraints(
                              minHeight: 0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  const Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Icons.horizontal_rule_outlined,
                                      size: 30,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  ListTile(
                                    leading: SvgPicture.asset(
                                      'assets/images/bookmark_icon.svg',
                                      color: primaryColor,
                                    ),
                                    title: Text('Saved Reels'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.multitrack_audio),
                                    title: Text('Saved Audio'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.star_sharp),
                                    title: Text('Saved effects'),
                                  ),
                                  ListTile(
                                    leading: SvgPicture.asset(
                                        'assets/images/heart_icon.svg',
                                        color: primaryColor),
                                    title: Text('Liked reels'),
                                  ),
                                ],
                              );
                            },
                            // barrierColor: primaryColor,
                          );
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/heart_icon.svg',
                          color: primaryColor,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('36k'),
                        SizedBox(
                          height: 15,
                        ),
                        SvgPicture.asset(
                          'assets/images/comment_icon.svg',
                          color: primaryColor,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('771'),
                        SizedBox(
                          height: 15,
                        ),
                        SvgPicture.asset(
                          'assets/images/send_in_dm_icon.svg',
                          height: 30,
                          width: 30,
                          color: primaryColor,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 26,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: primaryColor, width: 3.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(
                        'assets/images/profile1.jpg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            AssetImage('assets/images/profile1.jpg'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('nagarraghav20'),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("follow called");
                        },
                        child: Container(
                          width: 55,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Center(child: Text('Follow')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Which of these places would you go to first?'),
                  SizedBox(
                    height: 12,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.music_note,
                      size: 16,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("WOLNATION · Sail"),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.person,
                      size: 16,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("8 people"),
                  ]),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
