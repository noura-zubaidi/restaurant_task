import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:resturant_task/view/screens/login_screen.dart';

import '../widgets/customized_button.dart';
import '../widgets/customized_textfield.dart';
import 'home_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formkey = GlobalKey();

  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 78),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 28),
               SizedBox(
                width: 345,
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey.shade100,
                    hintText: 'Phone Number',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const CustomTextField(
                prefixIcon: Icons.email,
                hintText: 'Email',


              ),
              const SizedBox(height: 10),
              const CustomTextField(
                prefixIcon: Icons.person_rounded,
                hintText: 'Full Name',


              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                    checkColor: Colors.white,
                    activeColor: Colors.deepOrange,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 1),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4.5),
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }, text: 'Sign in',

                ),
              ),
              const SizedBox(height: 12),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Or sign in with',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(width: 100, child: Divider()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: Image.network(
                        "https://i.pinimg.com/originals/39/21/6d/39216d73519bca962bd4a01f3e8f4a4b.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 1,
                  ),
                  ClipOval(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: Image.network(
                        "https://i.pinimg.com/originals/c1/45/7e/c1457ec61545d41c3398072daf3cbd53.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 1,
                  ),
                  ClipOval(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: Image.network(
                        "https://qph.cf2.quoracdn.net/main-qimg-874b3e5fe6a58285fb9c52f108cf7bc5",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 16,),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: const TextStyle(
                        color: Colors.deepOrange,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
