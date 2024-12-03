// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/components/my_button.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/components/my_text_field.dart';

class SignupPage extends StatefulWidget {

  final void Function()? tooglePage;
  const SignupPage({super.key, required this.tooglePage});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //text controller

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();
  // BUILD UI
  @override
  Widget build(BuildContext context) {
    //SCAFFOLD
    return Scaffold(
      //BODY
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 100.0,
                  color: Theme.of(context).colorScheme.primary,
                ),

                //welcome back msg

                AutoSizeText(
                  "Let's create an account for you!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20.0),
                //email textfield
                CustomFormField(
                    controller: nameController,
                    hintText: "Username",
                    obscureText: false),

                const SizedBox(height: 20.0),
                //email textfield
                CustomFormField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),

                const SizedBox(height: 15.0),

                //pw textfield
                CustomFormField(
                    controller: pwController,
                    hintText: "Password",
                    obscureText: true),

                const SizedBox(height: 15.0),

                CustomFormField(
                    controller: confirmPwController,
                    hintText: "Confirm Password",
                    obscureText: true),
                //sign up

                const SizedBox(height: 15.0),

                CustomButton(
                  onTap: () {},
                  text: "Sign up",
                ),

                const SizedBox(height: 50.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Already a member? ",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.tooglePage,
                      child: AutoSizeText(
                        " Login now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight : FontWeight.bold
                          ),
                        
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
