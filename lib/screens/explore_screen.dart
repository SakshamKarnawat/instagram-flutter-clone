import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<void> refresh() async {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        // scrollBehavior: ScrollBehavior(
        //   androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        // ),
        slivers: [
          /* 
          SliverAppBar(
            title: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                color: Colors.white12,
              ),
              margin: const EdgeInsets.only(top: 8),
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    SvgPicture.asset(
                      'assets/images/search_icon.svg',
                      width: 22,
                      height: 22,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Search",
                      style: TextStyle(fontSize: 18, color: secondaryColor),
                    ),
                  ],
                ),
              ),
            ),
            floating: true,
            backgroundColor: mobileBackgroundColor,
          ),
           */ //const SizedBox(height: 10),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: Delegate(secondaryColor, "tiihlhlh"),
          ),
          //List of items:
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String _title;

  Delegate(this.backgroundColor, this._title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: backgroundColor,
      child: Center(
        child: Text(
          _title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
