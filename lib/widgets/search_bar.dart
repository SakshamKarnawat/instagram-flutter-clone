import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        focusNode: _searchFocus,
        dense: true,
        minLeadingWidth: 0,
        horizontalTitleGap: 18,
        minVerticalPadding: 0,
        leading: SvgPicture.asset(
          'assets/images/search_icon.svg',
          height: 22,
          width: 22,
          color: _searchFocus.hasFocus ? primaryColor : Colors.white54,
        ),
        title: Text(
          'Search',
          style: TextStyle(
              fontSize: 20,
              color: _searchFocus.hasFocus ? primaryColor : Colors.white54),
        ),
      ),
    );
  }
}
