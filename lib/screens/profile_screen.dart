import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/modal_sheets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  late final TabController _tabController;
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);

  bool _storyHighlightsExpanded = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Row(
          children: const [
            Icon(Icons.lock),
            SizedBox(width: 5),
            Text("saksham_227"),
            SizedBox(width: 5),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: secondaryColor,
              ),
            ),
          ],
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.menu_sharp),
              iconSize: 28,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => profileModalSheet(context),
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/profile2.jpg'),
                        ),
                      ),
                      Column(
                        children: const [
                          Text(
                            '123',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text('Posts'),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '770k',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text('Followers'),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '972',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text('Following'),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 15),
                    child: Text(
                      "Samay Raina",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3, left: 15),
                    child: Text(
                      "Comedian",
                      style: TextStyle(fontSize: 16, color: secondaryColor),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3, left: 15),
                    child: Text(
                      "I was a comedian till someone ate a bat in.bookmyshow.com/eehfkjdhjdshjkdshf",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: const [
                            Positioned(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage('assets/images/story2.jpg'),
                              ),
                              left: 40,
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage('assets/images/story1.jpg'),
                              ),
                              left: 20,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage('assets/images/profile1.jpg'),
                            ),
                          ],
                        ),
                        const Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 8),
                            child: Text(
                              "Followed by munawar.faruqui, thesuhanishah and 76 others",
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Edit Profile'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(color: Colors.white38),
                              ),
                              elevation: 0.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(color: Colors.white38),
                              ),
                              elevation: 0.0,
                            ),
                            onPressed: () {},
                            child: const Text('▼'),
                          ),
                        ),
                      ],
                    ),
                    /* 
              Someone else's profile view:
              Wrap(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white38),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Following ▼",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white38),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Message',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.white38),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.white38),
                        ),
                        elevation: 0.0,
                      ),
                      onPressed: () {},
                      child: Text('▼')),
                ],
              ), */
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Story highlights',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _storyHighlightsExpanded =
                                      !_storyHighlightsExpanded;
                                });
                              },
                              child: _storyHighlightsExpanded
                                  ? const Text('▲')
                                  : const Text('▼'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        if (_storyHighlightsExpanded)
                          const Text(
                              'Keep your favorite stories on your profile'),
                        if (_storyHighlightsExpanded)
                          const SizedBox(height: 10),
                        if (_storyHighlightsExpanded)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 1, color: Colors.white)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text('New'),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(''),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(''),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(''),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(''),
                                  ],
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            SliverAppBar(
              primary: false,
              // floating: true,
              pinned: true,
              toolbarHeight: 0,
              // pinned: true,
              // floating: true,
              backgroundColor: mobileBackgroundColor,
              forceElevated: isScrolled,
              bottom: TabBar(
                onTap: (index) {
                  setState(() {});
                },
                controller: _tabController,
                //isScrollable: false,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.white24,
                labelColor: Colors.red,
                // indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    icon: SvgPicture.asset(
                      'assets/images/grid.svg',
                      width: 26,
                      height: 26,
                      color: _tabController.index == 0
                          ? primaryColor
                          : Colors.white24,
                    ),
                    iconMargin: EdgeInsets.zero,
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      'assets/images/play.svg',
                      width: 60,
                      height: 60,
                      color: _tabController.index == 1
                          ? primaryColor
                          : Colors.white24,
                    ),
                    iconMargin: EdgeInsets.zero,
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      'assets/images/tagged_square.svg',
                      width: 28,
                      height: 28,
                      color: _tabController.index == 2
                          ? primaryColor
                          : Colors.white24,
                    ),
                    iconMargin: EdgeInsets.zero,
                  ),
                ],

                // unselectedLabelStyle: TextStyle(color: Colors.grey),
                // labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  getGridView(),
                  getGridView(),
                  getGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getGridView() {
    return GridView(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      children: [
        Ink.image(
          image: const AssetImage('assets/images/profile1.jpg'),
          child: InkWell(
            onLongPress: () {
              print("Long pressed");
            },
            onTap: () {},
          ),
        ),
        Ink.image(
          image: const AssetImage('assets/images/profile1.jpg'),
          child: InkWell(
            onLongPress: () {
              print("Long pressed");
            },
            onTap: () {},
          ),
        ),
        Ink.image(
          image: const AssetImage('assets/images/profile1.jpg'),
          child: InkWell(
            onLongPress: () {
              print("Long pressed");
            },
            onTap: () {},
          ),
        ),
        Ink.image(
          image: const AssetImage('assets/images/profile1.jpg'),
          child: InkWell(
            onLongPress: () {
              print("Long pressed");
            },
            onTap: () {},
          ),
        ),
        Ink.image(
          image: const AssetImage('assets/images/profile1.jpg'),
          child: InkWell(
            onLongPress: () {
              print("Long pressed");
            },
            onTap: () {},
          ),
        ),
        Ink.image(
          image: const AssetImage('assets/images/profile1.jpg'),
          child: InkWell(
            onLongPress: () {
              print("Long pressed");
            },
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
