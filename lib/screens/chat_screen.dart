import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/providers/navbar_provider.dart';
import 'package:instagram_clone/providers/pageview_camerafeedchat_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/profile_listtile.dart';
import 'package:instagram_clone/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static const List<Tab> _chatScreenTabs = <Tab>[
    Tab(child: Text('Chats', style: TextStyle(fontSize: 16))),
    Tab(child: Text('Calls', style: TextStyle(fontSize: 16))),
    Tab(child: Text('Requests', style: TextStyle(fontSize: 16))),
  ];

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
              Provider.of<PageViewProvider>(context, listen: false)
                  .changePage(1);
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
                      style: TextStyle(fontSize: 24),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    )),
              ),
              RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset('assets/images/down_arrow_icon.svg',
                      color: Colors.white, width: 14, height: 14)),
            ],
          ),
          actions: [
            SvgPicture.asset('assets/images/videocam1.svg',
                color: Colors.white, width: 35, height: 35),
            const SizedBox(width: 30),
            SvgPicture.asset('assets/images/new_message_icon.svg',
                color: Colors.white, width: 30, height: 30),
            const SizedBox(width: 10),
          ],
          bottom: TabBar(
            indicatorColor: primaryColor,
            // isScrollable: false,
            // unselectedLabelColor: Colors.amber,
            controller: _tabController,
            tabs: _chatScreenTabs,
          ),

          // shadowColor: Colors.white,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 5, color: Colors.white54),
                    ),
                  ),
                  SizedBox(height: 15),
                  SearchBar(),
                  ProfileListTile(
                    profilePicURL: "assets/images/profile1.jpg",
                    name: "Raghav Nagar",
                    msg: "Pls bhai yar",
                    timeAgo: "7h",
                    isSeen: true,
                    hasStories: false,
                    allStoriesViewed: false,
                  ),
                  ProfileListTile(
                    profilePicURL: "assets/images/profile2.jpg",
                    name: "Samay Raina",
                    msg: "Hey Dude! Kaisa hai?",
                    timeAgo: "2d",
                    isSeen: false,
                    hasStories: false,
                    allStoriesViewed: false,
                  ),
                ],
              ),
            ),
            Text('asas'),
            Text('asas'),
          ],
        ),
      ),
    );
  }
}


/*

AppBar: 
back button  username  switch_ac_dropdown                                video call icon      newchat_icon
fixed TabBar - Chats | Calls | Requests
Chats: singlechildscrollview w/ swipe up to Refresh, search bar on top (not pinned or floating), chat listtiles
Calls: singlechildscrollview, audio video listtiles, recent listtiles, watch together blank horizontal view, call friend listtiles 
Requests: different page altogether, appbar w/ back & title, singlechildscrollview w column 
*/