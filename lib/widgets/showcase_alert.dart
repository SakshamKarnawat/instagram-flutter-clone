import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class ShowCaseAlert extends StatelessWidget {
  const ShowCaseAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      backgroundColor: primaryColor,
      elevation: 4,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "This element has no functionality. It's just there to look exactly like Instagram.",
                textAlign: TextAlign.center,
                style: TextStyle(color: mobileBackgroundColor, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Got It!',
                  style: TextStyle(color: blueColor, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
