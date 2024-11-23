import 'package:flutter/material.dart';
import 'package:xilium/custom_widgets/text_field.dart';
import 'package:xilium/custom_widgets/heading_text.dart';
import 'package:xilium/custom_widgets/buttons.dart';
import 'package:xilium/auth_screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  bool _isAgreed = false; // Track checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadingText(
                              txt: "Registration",
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Create your Account",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 210),
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      const TextFld(
                          lblText: "Full Name",
                          hintText: "Enter your Full Name",
                          prefixIcon: Icon(Icons.text_fields)),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextFld(
                        lblText: "Email",
                        hintText: "Enter your Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextFld(
                          lblText: "Password",
                          hintText: "Enter your Password",
                          prefixIcon: Icon(Icons.password)),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextFld(
                          lblText: "Confirm Password",
                          hintText: "Enter Confirm Password",
                          prefixIcon: Icon(Icons.password)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: _isAgreed,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isAgreed = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Agree with ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  InkWell(
                                      child: Text(
                                    "Terms & Conditions",
                                    style: TextStyle(color: Colors.blue),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      LargeButton(
                        name: "Register",
                        styling: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
