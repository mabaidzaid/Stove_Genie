import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stove_genie/bloc/state/bottom_bar_state.dart';
import 'package:stove_genie/pages/home/presentation/screen/home_screen.dart';
import 'package:stove_genie/pages/notification_screen/presentation/screen/notification_screen.dart';
import 'package:stove_genie/pages/profile_screen/presentation/screen/profile_screen.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/screen/saved_recipes_screen.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial());

  int currentIndex = 0;

  void setIndex(int index) {
    emit(BottomBarLoading());
    currentIndex = index;
    emit(BottomBarLoaded());
  }

  final List<Widget> screens = const [
    HomeScreen(),
    SavedRecipesScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
}
