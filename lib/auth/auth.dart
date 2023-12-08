import 'package:api_fech/data/bloc/auth/auth_bloc.dart';
import 'package:api_fech/screens/login_page.dart';
import 'package:api_fech/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool enabled = true;
  void go() {
    setState(() {
      enabled = !enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return BlocProvider(
        create: (context) => AuthBloc(),
        child: LoginPage(show: go),
      );
    } else {
      return BlocProvider(
        create: (context) => AuthBloc(),
        child: Signup(show: go),
      );
    }
  }
}
