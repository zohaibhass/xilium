import 'package:flutter/material.dart';
import 'package:xilium/custom_widgets/text_field.dart';
import 'package:xilium/custom_widgets/heading_text.dart';
import 'package:xilium/custom_widgets/buttons.dart';
import 'package:xilium/auth_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 30, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeadingText(
                          txt: "Sign in to your",
                        ),
                        HeadingText(
                          txt: "Account",
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Sign in to your Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 260),
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
              child: Form(
                key: FormKey,
                child: Column(
                  children: [
                    const TextFld(
                      errortext: "Email is Required",
                      lblText: "Email",
                      hintText: "Enter your Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextFld(
                        errortext: "Password is Required",
                        lblText: "Password",
                        hintText: "Enter your Password",
                        prefixIcon: Icon(Icons.password)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 160),
                      child: InkWell(
                          child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.blue),
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    LargeButton(
                      callback: () {
                        if (FormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Processing Data")));
                        }
                      },
                      name: "Login",
                      styling: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Color(0xffdadada),
                          height: 2,
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(child: Text("or login with")),
                        Expanded(
                            child: Divider(
                          color: Color(0xffdadada),
                          height: 2,
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffdadada)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Image.asset("assets/icons/apple.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffdadada)),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Image.asset("assets/icons/google.png")),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffdadada)),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Image.asset("assets/icons/facebook.png"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't Have Account?"),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen())),
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
