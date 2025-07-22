import 'package:flutter/material.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/auth/auth_gate.dart';
import 'package:stove_genie/pages/on_boarding/presentation/screen/get_cooking.dart';
import 'package:stove_genie/utils/helper.dart';
import 'dart:async';

import 'package:stove_genie/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;

  final _authCubit = Di().sl<AuthCubit>();

  Future<void> getSelfInfo() async {
    await _authCubit.getSelfInfo();
  }

  @override
  void initState() {
    super.initState();
    getSelfInfo();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthGate()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          AppImages.logoImage,
          width: getWidth(context) * 0.5,
          height: getHeight(context) * 0.25,
        ),
      ),
    );
  }
}
