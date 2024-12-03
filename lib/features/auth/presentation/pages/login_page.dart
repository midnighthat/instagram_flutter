// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/components/my_button.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/components/my_text_field.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {

  final void Function()? tooglePage;


  const LoginPage({super.key, required this.tooglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller

  final emailController = TextEditingController();
  final pwController = TextEditingController();

  //login button pressed

  void login() {
    // prepare email and pw
    final String email = emailController.text;
    final String pw = pwController.text;

    // auth cubit 
    final authCubit = context.read<AuthCubit>();

    // ensure email and pw fields are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      //login
      authCubit.login(email, pw);
    }
    // dispaly error if some fields are empty
    else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please enter both email and password"),
      ),
    );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }
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
                CustomFormField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),

                const SizedBox(height: 15.0),

                //pw textfield
                CustomFormField(
                    controller: pwController,
                    hintText: "Password",
                    obscureText: true
                    ),

                  const SizedBox(height: 15.0),
                //login

                CustomButton(
                  onTap: login,
                  text: "Login",
                  ),
                
                const SizedBox(height: 50.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Not a member? ",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.tooglePage,
                      child: AutoSizeText(
                        " Register now",
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
