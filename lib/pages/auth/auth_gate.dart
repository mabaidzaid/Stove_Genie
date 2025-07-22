import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/screen/bottombar_screen.dart';
import 'package:stove_genie/pages/on_boarding/presentation/screen/get_cooking.dart';

import '../../../../../core/di_container.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final _authCubit = Di().sl<AuthCubit>();

  @override
  void initState() {
    _authCubit.getSelfInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return HomeBottomBar();
          } else {
            return const GetCooking();
          }
        },
      ),
    );
  }
}
