import 'package:get_it/get_it.dart';
import 'package:stove_genie/api/recipe_api.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/bloc/cubit/bottom_bar_cubit.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';

class Di {
  final sl = GetIt.I;

  Future<void> init() async {
    //apis
    sl.registerLazySingleton<RecipeApi>(() => RecipeApiImpl());

    //cubits
    sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
    sl.registerLazySingleton<RecipeCubit>(() => RecipeCubit(sl()));
    sl.registerLazySingleton<BottomBarCubit>(() => BottomBarCubit());
  }
}
