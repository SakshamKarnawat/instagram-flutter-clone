import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/authentication.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Uint8List? imageFile;
  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                      InkWell(
                        onTap: () async {
                          Uint8List? image =
                              await pickImage(ImageSource.gallery);
                          setState(() {
                            imageFile = image;
                          });
                        },
                        child: SizedBox(
                          height: 135,
                          width: 135,
                          child: imageFile != null
                              ? CircleAvatar(
                                  radius: 80,
                                  backgroundImage: MemoryImage(imageFile!),
                                )
                              : const CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(
                                      'https://180dc.org/wp-content/uploads/2016/08/default-profile.png'),
                                ),
                        ),
                        // child: Container(
                        //   height: 135,
                        //   width: 135,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     border: Border.all(
                        //       color: primaryColor,
                        //       width: 1.5,
                        //     ),
                        //   ),
                        //   child: const Icon(
                        //     Icons.person,
                        //     size: 80,
                        //     color: primaryColor,
                        //     //color: Colors.black,
                        //   ),
                        // ),
                      ),
                      //Phone and Email Tab:
                      const SizedBox(
                        height: 5,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.white54),
                              ),
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              splashFactory: NoSplash.splashFactory,
                              splashColor: Colors.red,
                              highlightColor: Colors.transparent,
                            ),
                            child: const TabBar(
                              enableFeedback: false,
                              indicatorColor: primaryColor,
                              tabs: [
                                Tab(text: 'PHONE'),
                                Tab(text: 'EMAIL'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            //Phone Tab view
                            ListView(
                              children: [
                                TextFieldInput(
                                  textEditingController: _phoneController,
                                  hintText: "Phone",
                                  textInputType: TextInputType.phone,
                                ),
                                const SizedBox(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      "You may receive SMS updates from Instagram and can opt out at any time.",
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  // margin:
                                  //     const EdgeInsets.symmetric(vertical: 15),
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF002d45)),
                                      // padding: MaterialStateProperty.all<EdgeInsets>(
                                      //     const EdgeInsets.symmetric(vertical: 17)),
                                    ),
                                    onPressed: () async {
                                      String res =
                                          await Authentication().signUpUser(
                                        email: "saksham@email.com",
                                        // displayName: "Saksham Karnawat",
                                        password: "password",
                                        username: "saksham",
                                        bio: "Saksham's bio",
                                        imageFile: imageFile!,
                                      );
                                      if (res != "Success!") {
                                        showSnackBar(res, context);
                                      }
                                    },
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Email Tab view
                            ListView(
                              children: [
                                TextFieldInput(
                                  textEditingController: _emailController,
                                  hintText: "Email",
                                  textInputType: TextInputType.emailAddress,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF002d45)),
                                      // padding: MaterialStateProperty.all<EdgeInsets>(
                                      //     const EdgeInsets.symmetric(vertical: 17)),
                                    ),
                                    onPressed: () async {
                                      String res =
                                          await Authentication().signUpUser(
                                        email: "saksham@email.com",
                                        // displayName: "Saksham Karnawat",
                                        password: "password",
                                        username: "saksham",
                                        bio: "Saksham's bio",
                                        imageFile: imageFile!,
                                      );
                                      print(res);
                                    },
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Flexible(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white38),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Log in");
                    },
                    child: Container(
                      child: const Text(
                        " Log in.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
