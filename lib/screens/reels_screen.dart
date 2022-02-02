import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/utils/modal_sheets.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final PageController _pageViewController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      // child: SingleReelScreen(),
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageViewController,
        scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
        itemCount: 5,
        itemBuilder: (context, index) {
          return SingleReelScreen(
            reelURL: reelsURLs[0],
            username: "saksham_22",
            userPictureURL: "assets/images/profile3.jpg",
            reelDescription: "This is an example of a reel description",
            noOfLikes: "33k",
            noOfComments: "828",
            isLiked: true,
            songName: "Coldplay · A Sky Full of Stars",
            noOfPeopleTagged: 5,
          );
        },
      ),
    );
  }
}

class SingleReelScreen extends StatefulWidget {
  final String reelURL;
  final String reelDescription;
  final String username;
  final String userPictureURL;
  final bool isLiked;
  final String noOfComments;
  final String noOfLikes;
  final int noOfPeopleTagged;
  final String songName;
  const SingleReelScreen({
    Key? key,
    required this.reelDescription,
    required this.reelURL,
    required this.username,
    required this.userPictureURL,
    required this.isLiked,
    required this.noOfComments,
    required this.noOfLikes,
    required this.noOfPeopleTagged,
    required this.songName,
  }) : super(key: key);

  @override
  _SingleReelScreenState createState() => _SingleReelScreenState();
}

class _SingleReelScreenState extends State<SingleReelScreen>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.reelURL);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(1);
    super.initState();
  }

  @override
  void dispose() {
    print("DISPOSED HAHAHAHA\n\n\n\n\n\n");
    _videoPlayerController.dispose();
    super.dispose();
  }

  bool _visibility = false;
  bool _mute = true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      _visibility = true;
                      _mute = !_mute;
                      if (_videoPlayerController.value.volume == 1.0) {
                        _videoPlayerController.setVolume(0.0);
                      } else {
                        _videoPlayerController.setVolume(1.0);
                      }
                    });
                    Future.delayed(Duration(milliseconds: 2000), () {
                      setState(() {
                        _visibility = false;
                      });
                    });
                  },
                  onDoubleTap: () {
                    //TODO: Heart animation
                  },
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController..play()),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _visibility ? 1 : 0,
                child: Center(
                  child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        _mute ? Icons.volume_up : Icons.volume_off,
                        color: primaryColor,
                      )),
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
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(
                            Icons.menu_sharp,
                            size: 32,
                          ),
                          onPressed: () => reelsModalSheet(context),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Column(
                        children: [
                          widget.isLiked
                              ? SvgPicture.asset(
                                  'assets/images/heart_filled.svg',
                                  color: Colors.red,
                                  height: 30,
                                  width: 30,
                                )
                              : SvgPicture.asset(
                                  'assets/images/heart_icon.svg',
                                  color: primaryColor,
                                  height: 30,
                                  width: 30,
                                ),
                          const SizedBox(height: 8),
                          Text(widget.noOfLikes),
                          const SizedBox(height: 15),
                          SvgPicture.asset(
                            'assets/images/comment_icon.svg',
                            color: primaryColor,
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(widget.noOfComments),
                          const SizedBox(height: 15),
                          SvgPicture.asset(
                            'assets/images/send_in_dm_icon.svg',
                            height: 30,
                            width: 30,
                            color: primaryColor,
                          ),
                          const SizedBox(height: 15),
                          const Icon(Icons.more_vert, size: 26),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: primaryColor, width: 3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          widget.userPictureURL,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
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
                          backgroundImage: AssetImage(widget.userPictureURL),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 15),
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
                                    const BorderRadius.all(Radius.circular(6))),
                            child: const Center(child: Text('Follow')),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 5),
                      child: Text(widget.reelDescription),
                    ),
                    const SizedBox(height: 12),
                    Row(children: [
                      const SizedBox(width: 7),
                      const FaIcon(
                        FontAwesomeIcons.music,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(widget.songName),
                      const SizedBox(width: 6),
                      const Icon(Icons.person, size: 16),
                      const SizedBox(width: 4),
                      Text("${widget.noOfPeopleTagged} people"),
                    ]),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          );
        } else {
          return const ReelLoadingScreen();
        }
      },
    );
  }
}

class ReelLoadingScreen extends StatelessWidget {
  const ReelLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/camera_icon.svg',
                  color: primaryColor,
                  height: 28,
                  width: 28,
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.menu_sharp,
                    size: 32,
                  ),
                  onPressed: () => reelsModalSheet(context),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 15,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 15,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 15,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
