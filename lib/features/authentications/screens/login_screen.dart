import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:xilium/common/widgets/custom_widgets/text_field.dart';
import 'package:xilium/common/widgets/custom_widgets/heading_text.dart';
import 'package:xilium/common/widgets/custom_widgets/buttons.dart';
import 'package:xilium/features/authentications/screens/signup_screen.dart';
import 'package:xilium/common/widgets/custom_widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FormKey = GlobalKey<FormState>();
  TextEditingController user_name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          HeadingText(txt: "Sign in to your"),
                          HeadingText(txt: "Account"),
                          SizedBox(height: 3),
                          
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
                          topRight: Radius.circular(50),
                        ),
                      ),
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
                      TextFld(
                        controller_name: user_name,
                        errortext: "User Name is Required",
                        lblText: "User Name",
                        hintText: "Enter Username",
                        prefixIcon: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 20),
                      TextFld(
                        controller_name: password,
                        errortext: "Password is Required",
                        lblText: "Password",
                        hintText: "Enter your Password",
                        prefixIcon: const Icon(Icons.password),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 160),
                        child: InkWell(
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      LargeButton(
                        callback: () {
                          if (FormKey.currentState!.validate()) {
                            userLogin();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please fill in all fields.")),
                            );
                          }
                        },
                        name: "Login",
                        styling: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color(0xffdadada),
                              height: 2,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(child: Text("or login with")),
                          Expanded(
                            child: Divider(
                              color: Color(0xffdadada),
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffdadada)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Image.asset("assets/icons/apple.png"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffdadada)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Image.asset("assets/icons/google.png"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffdadada)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Image.asset("assets/icons/facebook.png"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't Have Account?"),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()),
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void userLogin() async {
    if (user_name.text.isEmpty || password.text.isEmpty) {
      print("Username and password are required.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username and password are required.")),
      );
      return;
    }

    var url = "https://xilium.no/wp-json/mobile-apis/login";
    var loginData = {
      "username": user_name.text,
      "password": password.text,
    };
    var encodeToJson = json.encode(loginData);
    var parseUrl = Uri.parse(url);

    try {
      Response response = await http.post(
        parseUrl,
        body: encodeToJson,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful!")),
        );
      } else {
        print("Failed to login. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to login. Please try again.")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }
}
