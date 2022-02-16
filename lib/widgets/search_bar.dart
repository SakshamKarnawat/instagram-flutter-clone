import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

/* class SearchBar extends StatefulWidget {
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
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        leading: SvgPicture.asset(
          'assets/images/search_icon.svg',
          height: 18,
          width: 18,
          color: _searchFocus.hasFocus ? primaryColor : Colors.white54,
        ),
        title: Text(
          'Search',
          style: TextStyle(
              fontSize: 18,
              color: _searchFocus.hasFocus ? primaryColor : Colors.white54),
        ),
      ),
    );
  }
}
 */

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Color iconColor = secondaryColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Implement full chat search screen
      },
      onLongPressStart: (_) {
        setState(() {
          iconColor = primaryColor;
        });
      },
      onLongPressEnd: (_) {
        setState(() {
          iconColor = secondaryColor;
        });
      },
      onLongPressCancel: () {
        setState(() {
          iconColor = secondaryColor;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 5),
            SvgPicture.asset(
              'assets/images/search_icon.svg',
              color: iconColor,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 15),
            const Text(
              'Search',
              style: TextStyle(
                fontSize: 18,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
