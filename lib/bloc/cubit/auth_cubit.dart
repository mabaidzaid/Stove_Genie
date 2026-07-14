import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stove_genie/bloc/state/auth_state.dart';
import 'package:stove_genie/helpers/warning_helper.dart';
import 'package:stove_genie/models/user/user_model.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/screen/bottombar_screen.dart';
import 'package:stove_genie/pages/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  int selectedIndex = 0;
  bool isChecked = false;
  bool isSearching = false;
  List<UserModel?> users = [];
  List<UserModel?> serachingUsers = [];

  List<String> items = ['100', '200', '300'];

  String selectedPrice = '';

  List<String> selectedSkills = [];

  void getSkills(String skill) {
    emit(AuthLoading());
    if (selectedSkills.contains(skill)) {
      selectedSkills.remove(skill);
    } else {
      selectedSkills.add(skill);
    }
    emit(AuthLoaded());
  }

  void isCheck() {
    isChecked = !isChecked;
  }

  void searchUsers(String value) {
    isSearching = true;
    emit(AuthLoading());
    serachingUsers = users.where(
      (element) {
        return element!.name.toLowerCase().contains(value.toLowerCase()) ||
            element.service.toLowerCase().contains(value.toLowerCase());
      },
    ).toList();
    emit(AuthLoaded());
  }

  void cancelSearch() {
    emit(AuthLoading());
    isSearching = false;
    emit(AuthLoaded());
  }

  // void filterData(String service) {
  //   isSearching = true;
  //   emit(AuthLoading());
  //   serachingUsers = users.where(
  //     (element) {
  //       return element!.service.toLowerCase().contains(service.toLowerCase());
  //     },
  //   ).toList();
  //   emit(AuthLoaded());
  // }

  UserModel user = const UserModel();
  getUserData(UserModel user) {
    emit(AuthLoading());
    this.user = user;
    emit(AuthLoaded());
  }

  Future<void> fetchAllUsers() async {
    emit(AuthLoading());
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthError());
      log(e.toString());
    }
  }

  Future<void> getSelfInfo() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      var user = UserModel.fromJson(value.data() ?? {});
      log("user data: $user");

      getUserData(user);
    });
  }

  /// get the image url
  getImageUrl(String url) {
    emit(AuthLoading());
    user = user.copyWith(
      image: url,
    );
    emit(AuthLoading());
  }

  Future<String> signUp({
    String? username,
    required String email,
    required String password,
    required BuildContext context,
    String? number,
    String? id,
    String? service,
    String? image,
    String? bio,
    double? price,
  }) async {
    emit(AuthLoading());
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        UserModel user = UserModel(
          id: value.user?.uid ?? "",
          email: email,
          city: "",
          image: image ?? "",
          licenseId: id ?? "",
          state: 'user',
          name: username ?? '',
          notifications: false,
          number: number ?? "",
          // pushToken: await NotiApi().getToken() ?? "",
          pushToken: "",
          price: price ?? 0.0,
          service: service ?? "",
          experience: 0,
          orderCompleted: 0,
          bio: bio ?? "",
          skills: selectedSkills,
        );

        return await FirebaseFirestore.instance
            .collection("users")
            .doc(user.id)
            .set(user.toJson())
            .then((value) {
          this.user = user;
          emit(AuthLoading());
          WarningHelper.showSuccesToast('successfully sign up', context);

          return "success";
        });
      });
    } catch (e) {
      emit(AuthError());
      log(e.toString());
      WarningHelper.showErrorToast('$e', context);
      return "error";
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      emit(AuthLoading());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        emit(AuthLoaded());
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeBottomBar()),
          (route) => false,
        );
        WarningHelper.showSuccesToast('successfully sign in', context);
      }).onError((error, context) {
        emit(AuthError());
        WarningHelper.showErrorToast('$error', context);
      });
    } catch (e) {
      emit(AuthError());
      log(e.toString());
      WarningHelper.showErrorToast('$e', context);
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      users.clear();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false,
      );
    } catch (e) {
      log('Sign out error: $e');
    }
  }

  /// inside your AuthCubit:

  Future<void> signInWithGoogle(BuildContext context) async {
    emit(AuthLoading());
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId:
            '238511471890-m6m1065ng1ppqi7hpdjekulcoa6fo8is.apps.googleusercontent.com',
      );

      final googleUser = await GoogleSignIn.instance.authenticate();

      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final firebaseUser = userCred.user;
      if (firebaseUser == null) {
        emit(AuthError());
        return;
      }

      emit(AuthLoaded());
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeBottomBar()),
        (_) => false,
      );
      WarningHelper.showSuccesToast(
          'Successfully signed in with Google', context);
    } catch (e) {
      emit(AuthError());
      log('Google sign-in error: $e');
      WarningHelper.showErrorToast('Google sign-in failed: $e', context);
    }
  }
}
