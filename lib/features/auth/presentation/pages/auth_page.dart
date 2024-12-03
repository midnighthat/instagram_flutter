/* 
  Auth page - thsi page to determine to show the login page or signup pages
 */

import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/pages/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  // initially, show login page
  bool showLoginPage = true;

  //toogle between pages

  void tooglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(
        tooglePage: tooglePage,
      );
    } else {
      return SignupPage(
        tooglePage: tooglePage,
      );
    }
  }
}