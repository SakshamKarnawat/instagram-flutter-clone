import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/providers/navbar_provider.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/chat_screen.dart';
import 'package:instagram_clone/screens/explore_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/pageview_camerafeedchat.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/reels_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _pageIndex =
        Provider.of<NavBarProvider>(context, listen: false).getNavbarIndex;
    PageController _pageController =
        Provider.of<NavBarProvider>(context).getNavbarPageController;
    print("build called");
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PageViewCameraFeedChat(),
          ExploreScreen(),
          ReelsScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
        //onPageChanged: Provider.of<NavBarProvider>(context).onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _pageIndex,
        activeColor: primaryColor,
        onTap: Provider.of<NavBarProvider>(context).bottomNavBarTapped,
        // onTap: Provider.of<NavBarProvider>(context).bottomNavBarTapped,
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _pageIndex == 0
                  ? 'assets/images/home_icon_filled.svg'
                  : 'assets/images/home_icon.svg',
              width: 24,
              height: 24,
              color: _pageIndex == 0 ? primaryColor : secondaryColor,
            ),
            backgroundColor: _pageIndex == 0 ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/search_icon.svg',
              width: _pageIndex == 1 ? 34 : 30,
              height: _pageIndex == 1 ? 34 : 30,
              color: _pageIndex == 1 ? primaryColor : secondaryColor,
            ),
            backgroundColor: _pageIndex == 1 ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _pageIndex == 2
                  ? 'assets/images/reels_filled_icon.svg'
                  : 'assets/images/reels_icon.svg',
              height: _pageIndex == 2 ? 30 : 24,
              width: 24,
              color: _pageIndex == 2 ? primaryColor : secondaryColor,
            ),
            backgroundColor: _pageIndex == 2 ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _pageIndex == 3
                  ? 'assets/images/heart_filled.svg'
                  : 'assets/images/heart_icon.svg',
              width: 24,
              height: 24,
              color: _pageIndex == 3 ? primaryColor : secondaryColor,
            ),
            backgroundColor: _pageIndex == 3 ? primaryColor : secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: CircleAvatar(
                radius: _pageIndex == 4 ? 16 : 14,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _pageIndex == 4 ? primaryColor : Colors.white24,
                  width: 2,
                ),
              ),
            ),
            backgroundColor: _pageIndex == 4 ? primaryColor : secondaryColor,
          ),
        ],
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              //headerSilverBuilder only accepts slivers
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('My Top Widget'),
                  ),
                  TabBar(
                    tabs: [
                      Tab(child: Text('Available')),
                      Tab(child: Text('Taken')),
                    ],
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              // I wrapped large widgets in the SingleChildScrollView
              SingleChildScrollView(
                child: Text('1') /*Very large widget*/,
              ),
              Text('2'),
            ],
          ),
        ),
      ),
    );
  }
}
