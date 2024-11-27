// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/components/my_button.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller

  final emailController = TextEditingController();
  final pwController = TextEditingController();
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
                  "Welcome back, you have been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20.0),
                //email textfield
                MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),

                const SizedBox(height: 15.0),

                //pw textfield
                MyTextField(
                    controller: pwController,
                    hintText: "Password",
                    obscureText: true
                    ),

                  const SizedBox(height: 15.0),
                //login

                CustomButton(
                  onTap: (){},
                  text: "Login",
                  ),
                
                const SizedBox(height: 50.0),

                AutoSizeText(
                  "Not a member? Register now"
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
