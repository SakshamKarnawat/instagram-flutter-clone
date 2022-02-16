import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

class UserPost extends StatelessWidget {
  final String username;
  final String profilePicURL;
  final bool areUserStoriesViewed;
  final int noOfLikes;
  final int noOfComments;
  final String timeAgo;
  final String postURL;

  const UserPost({
    Key? key,
    required this.username,
    required this.profilePicURL,
    required this.areUserStoriesViewed,
    required this.noOfLikes,
    required this.noOfComments,
    required this.timeAgo,
    required this.postURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 5,
      ),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              areUserStoriesViewed
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: 22,
                        child: ClipOval(
                          child: Image.asset(
                            profilePicURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: mobileBackgroundColor,
                          child: CircleAvatar(
                            radius: 20,
                            child: ClipOval(
                              child: Image.asset(
                                profilePicURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          //Post:
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            height: 300,
            width: double.infinity,
            child: Image.asset(
              postURL,
              color: Colors.white,
              fit: BoxFit.fill,
            ),
          ),
          //
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.favorite_outline,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/comment_icon.svg',
                  height: 24,
                  width: 24,
                  color: primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/send_in_dm_icon.svg',
                  height: 24,
                  width: 24,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/bookmark_icon.svg',
                  height: 24,
                  width: 24,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "$noOfLikes likes",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "View all $noOfComments comments",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  radius: 16,
                  child: ClipOval(
                    child: Image.asset(
                      profilePicURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Text(
                "Add a comment...",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/images/heart_filled_small.svg',
                  height: 16,
                  width: 16,
                  // color: Colors.red,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("🙌"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 16,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "$timeAgo ago",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
