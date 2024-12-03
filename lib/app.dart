import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_flutter/features/auth/data/firebase_auth_repo.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/cubits/auth_states.dart';
import 'package:instagram_clone_flutter/features/auth/presentation/pages/auth_page.dart';
import 'package:instagram_clone_flutter/features/post/presentation/pages/home_page.dart';
import 'package:instagram_clone_flutter/themes/light_mode.dart';

/*
  APP - root Level
  Repositories for the database
    -irebase 

  bloc providers: for state managment
    -auth
    -profile
    -post 
    -search
    -theme
  Check auth state
    - unauthenticated -> auth page (login/signup)
    - authenticated -> home page
*/

class MyApp extends StatelessWidget {

  final authRepo = FirebaseAuthRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provide cubit to app
    return BlocProvider(create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, authState){

          print(authState);
          // unauthenticated -> auth page
          if (authState is Unauthenticated){
            return const AuthPage();
          }
          // authenticated -> home page
          if (authState is Authenticated){
            return const HomePage();
          }
          // loading..
          else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }, 
        listener: (context , state){

        }),
      ),
    );
  }
}