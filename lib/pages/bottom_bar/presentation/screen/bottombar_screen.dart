import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stove_genie/bloc/cubit/bottom_bar_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/recipe/screen/add_recipe_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder(
        bloc: _bottomBarCubit,
        builder: (context, state) {
          return _bottomBarCubit.screens[_bottomBarCubit.currentIndex];
        },
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: AppColors.whiteColor,
        child: BlocBuilder(
          bloc: _bottomBarCubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 40,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavItem(
                        context,
                        index: 0,
                        icon: AppImages.homeunSelected,
                        selectedIcon: AppImages.homeSelected,
                      ),
                      _buildNavItem(
                        context,
                        index: 1,
                        icon: AppImages.saveUnSelected,
                        selectedIcon: AppImages.saveselected,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 40,
                    children: [
                      _buildNavItem(
                        context,
                        index: 2,
                        icon: AppImages.notificatonUnselected,
                        selectedIcon: AppImages.notificatonselected,
                      ),
                      _buildNavItem(
                        context,
                        index: 3,
                        icon: AppImages.profileunseleted,
                        selectedIcon: AppImages.profileSeleted,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(

      //   backgroundColor: AppColors.buttonColor,
      //   onPressed: () {},
      //   child: SvgPicture.asset(
      //     AppImages.plusIcon,
      //   ),
      // ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddRecipeScreen()),
          );
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              color: AppColors.buttonColor, shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.plusIcon),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required int index,
      required String icon,
      required String selectedIcon}) {
    return GestureDetector(
      onTap: () => _bottomBarCubit.setIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            _bottomBarCubit.currentIndex == index ? selectedIcon : icon,
          ),
          // const SizedBox(height: 5),
          // if (_bottomBarCubit.currentIndex == index)
          //   // Container(
          //   //   height: 4,
          //   //   width: 4,
          //   //   decoration: const BoxDecoration(
          //   //       borderRadius: BorderRadius.all(Radius.circular(2)),
          //   //       color: AppColors.buttonColor),
          //   // ),
        ],
      ),
    );
  }
}

final _bottomBarCubit = Di().sl<BottomBarCubit>();
