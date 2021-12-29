import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('English'),
                        Icon(Icons.keyboard_arrow_down),
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
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 14)),
                        ),
                        onPressed: () {
                          print("Log in function");
                        },
                        child: const Text('Log In'),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //text - forgot your login details? Richtextspan:Get help logging in.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            "Forgot your login details?",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 13),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Get help logging in.");
                          },
                          child: Container(
                            child: const Text(
                              " Get help logging in.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                        ),
                      ],
                    ),
                    //Divider------------OR-------------Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: const [
                          Expanded(
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
                          Expanded(
                            child: Divider(
                              color: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //blue Facebook icon, Log in with Facebook text button
                    Row(
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
                    print("Sign up.");
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
