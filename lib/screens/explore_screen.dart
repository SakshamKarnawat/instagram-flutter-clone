import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  bool _fullSearch = true;
  bool _clearSearchIcon = false;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          // scrollBehavior: ScrollBehavior(
          //   androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          // ),
          slivers: [
            SliverAppBar(
              leading: _fullSearch
                  ? null
                  : IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _fullSearch = true;
                          _searchFocus.unfocus();
                        });
                      },
                    ),
              leadingWidth: 40,
              title: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white12,
                  ),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        if (_fullSearch)
                          SvgPicture.asset(
                            'assets/images/search_icon.svg',
                            width: 22,
                            height: 22,
                            color: primaryColor,
                          ),
                        if (_fullSearch) const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            focusNode: _searchFocus,
                            cursorColor: secondaryColor,
                            cursorWidth: 1,
                            controller: _searchController,
                            onTap: () {
                              setState(() {
                                _fullSearch = false;
                              });
                              _searchFocus.requestFocus();
                            },
                            onEditingComplete: () {
                              _searchFocus.unfocus();
                              setState(() {
                                _fullSearch = true;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusColor: primaryColor,
                              hintText: "Search",
                            ),
                            onChanged: (_) {
                              setState(() {
                                _searchFocus.requestFocus();
                              });
                            },
                            style: TextStyle(fontSize: 18, color: primaryColor),
                          ),
                        ),
                        if (!_fullSearch && _searchController.text != "")
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                              child: const Icon(
                                Icons.clear_sharp,
                                size: 20,
                                color: Colors.white60,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              floating: true,
              backgroundColor: mobileBackgroundColor,
            ),
            //const SizedBox(height: 10),
            //List of posts:
            _fullSearch
                ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Ink.image(
                          image: const AssetImage('assets/images/profile1.jpg'),
                          child: InkWell(
                            onLongPress: () {
                              print("Long pressed");
                            },
                            onTap: () {},
                          ),
                        );
                      },
                      childCount: 25,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: SizedBox(),
                  ),
          ],
        ),
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
