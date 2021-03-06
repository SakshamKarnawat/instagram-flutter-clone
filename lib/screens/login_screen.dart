import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/providers/auth_provider.dart';
import 'package:instagram_clone/resources/authentication.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _auth = ref.read(authProvider);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  late final Authentication _auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Language selector
                    //by default, English (India) dropdown arrow down ios
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'English (India)',
                          style: TextStyle(color: Colors.white54),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                    //instagram svg
                    Flexible(flex: 2, child: Container()),
                    SvgPicture.asset(
                      'assets/images/ic_instagram.svg',
                      color: primaryColor,
                      height: 48,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    //text field username
                    TextFieldInput(
                      textEditingController: _emailController,
                      hintText: "Phone number, email or username",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //text field password
                    TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: "Password",
                      textInputType: TextInputType.text,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //login button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF002d45)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(vertical: 14)),
                        ),
                        onPressed: () async {
                          String result = await _auth.logInUser(
                              email: "saksham@email.com", password: "password");

                          if (result != "Success!") {
                            showSnackBar(result, context);
                          }
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //text - forgot your login details? Richtextspan:Get help logging in.
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: const Text(
                              "Forgot your login details?",
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 13),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                          Container(
                            child: const Text(
                              " Get help logging in.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                        ],
                      ),
                    ),
                    //Divider------------OR-------------Divider
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: const [
                            Flexible(
                              child: Divider(
                                color: Colors.white30,
                              ),
                            ),
                            Text(
                              "  OR  ",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            Flexible(
                              child: Divider(
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //blue Facebook icon, Log in with Facebook text button
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.facebook_outlined,
                            color: blueColor,
                            size: 32,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Log in with Facebook',
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(),
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              //color: Colors.red,
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white38),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                GestureDetector(
                  onTap: () {
                    print("Sign up");
                  },
                  child: Container(
                    child: const Text(
                      " Sign up.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
