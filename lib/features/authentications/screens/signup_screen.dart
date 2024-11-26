import 'package:flutter/material.dart';
import 'package:xilium/common/widgets/custom_widgets/text_field.dart';
import 'package:xilium/common/widgets/custom_widgets/heading_text.dart';
import 'package:xilium/common/widgets/custom_widgets/buttons.dart';
import 'package:xilium/features/authentications/models/user_model.dart';
import 'package:xilium/features/authentications/controllers/user_controller.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserController signupController = UserController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController sureName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController telephone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeadingText(txt: "Registration"),
                        SizedBox(height: 3),
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
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFld(
                      controller_name: firstName,
                      lblText: "First Name*",
                      hintText: "Enter your First Name",
                      prefixIcon: const Icon(Icons.text_fields),
                      errortext: "First Name is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: sureName,
                      lblText: "Sure Name*",
                      hintText: "Enter your Sure Name",
                      prefixIcon: const Icon(Icons.text_fields),
                      errortext: "Sure Name is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: userName,
                      lblText: "User Name*",
                      hintText: "Enter User Name",
                      prefixIcon: const Icon(Icons.person),
                      errortext: "User Name is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: address,
                      lblText: "Address*",
                      hintText: "Enter your Address",
                      prefixIcon: const Icon(Icons.place),
                      errortext: "Address is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: email,
                      lblText: "Email",
                      hintText: "Enter your email",
                      prefixIcon: const Icon(Icons.phone),
                      errortext: "email is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: telephone,
                      lblText: "Telephone",
                      hintText: "Enter Telephone Number",
                      prefixIcon: const Icon(Icons.phone),
                      errortext: "Telephone Number is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: password,
                      lblText: "Password",
                      hintText: "Enter your Password",
                      prefixIcon: const Icon(Icons.lock),
                      errortext: "Last Name is Required",
                    ),
                    const SizedBox(height: 20),
                    TextFld(
                      controller_name: confirmPassword,
                      lblText: "Confirm Passwoord",
                      hintText: "Enter Confirm Password",
                      prefixIcon: const Icon(Icons.lock),
                      errortext: "Confirm Password is Required",
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: termsAccepted,
                          onChanged: (value) {
                            setState(() => termsAccepted = value ?? false);
                          },
                        ),
                        const Text("Agree with "),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Terms & Conditions",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    LargeButton(
                      callback: () async {
                        if (formKey.currentState!.validate()) {
                          final user = UserModel(
                            firstName: firstName.text,
                            surName: sureName.text,
                            userName: userName.text,
                            address: address.text,
                            telephone: telephone.text,
                            email: email.text,
                            password: password.text,
                            confirmPassword: confirmPassword.text,
                            termsAccepted: termsAccepted,
                          );

                          final result =
                              await signupController.registerUser(user);
                          if (result.containsKey("error")) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Registration failed: ${result['error']}"),
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registration successful!"),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          }
                        }
                      },
                      name: "Register",
                      styling: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
