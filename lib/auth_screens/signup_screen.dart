import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
  final FormKey = GlobalKey<FormState>();

  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController user_name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
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
                      height: 170,
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadingText(
                              txt: "Registration",
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Create your Account",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 130),
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
                        TextFld(
                          controller_name: first_name,
                          lblText: "First Name",
                          hintText: "Enter your First Name",
                          prefixIcon: const Icon(Icons.text_fields),
                          errortext: "First Name is Required",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                          controller_name: last_name,
                          lblText: "Last Name",
                          hintText: "Enter your Last Name",
                          prefixIcon:const Icon(Icons.text_fields),
                          errortext: "Last Name is Required",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                          controller_name: user_name,
                          lblText: "User Name",
                          hintText: "Enter User Name",
                          prefixIcon:const Icon(Icons.person),
                          errortext: "User Name is Required",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                          controller_name: address,
                          lblText: "Address",
                          hintText: "Enter your Address",
                          prefixIcon: const Icon(Icons.place),
                          errortext: "Address is Required",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                          controller_name: telephone,
                          lblText: "Telephone",
                          hintText: "Enter Telephone Number",
                          prefixIcon: const Icon(Icons.phone),
                          errortext: "Email is Required",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                          controller_name: email,
                          lblText: "Email",
                          hintText: "Enter your Email",
                          prefixIcon: const Icon(Icons.email),
                          errortext: "Email is Required",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                            controller_name: password,
                            errortext: "Password is Required",
                            lblText: "Password",
                            hintText: "Enter your Password",
                            prefixIcon: const Icon(Icons.password)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFld(
                            controller_name: confirm_password,
                            errortext: "This Field is Required",
                            lblText: "Confirm Password",
                            hintText: "Enter Confirm Password",
                            prefixIcon: const Icon(Icons.password)),
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
                              const Expanded(
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
                          callback: () {
                            if (FormKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Processing Data")));
                            }

                            return registerUser();
                          },
                          name: "Register",
                          styling: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
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

  void registerUser() async {
    var url = "https://xilium.no/wp-json/mobile-apis/register";
    var data = {
      "first_name": first_name.text,
      "last_name": last_name.text,
      "surname": user_name.text,
      "address": address.text,
      "telephone": telephone.text,
      "password": password.text,
      "confirm_password": confirm_password,
    };
    var encode_to_json = json.encode(data);

    var parse_url = Uri.parse(url);
    Response response = await http.post(parse_url,
        body: encode_to_json, headers: {"content_type": "application/jason"});

    var result = jsonDecode(response.body);
    print(result);
  }
}
