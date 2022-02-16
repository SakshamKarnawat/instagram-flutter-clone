import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class UserStories extends StatelessWidget {
  final String username;
  final String profilePicURL;
  final bool viewedAll;
  const UserStories(
      {Key? key,
      required this.username,
      required this.profilePicURL,
      required this.viewedAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: username == "Your Story"
          ? const EdgeInsets.only(left: 10)
          : const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // gradient: LinearGradient(
                  //     colors: [
                  //       Colors.blue,
                  //       Colors.red,
                  //     ],
                  //   ),
                  border: Border.all(
                    color: viewedAll ? Colors.white24 : blueColor,
                    width: 2,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: mobileBackgroundColor,
                      width: 3,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white12,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
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
              Positioned(
                top: 4,
                right: 4,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      print("Viewing $username's story...");
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 70,
            child: Text(
              username,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
