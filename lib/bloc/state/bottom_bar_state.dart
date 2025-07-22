import 'package:equatable/equatable.dart';

sealed class BottomBarState extends Equatable {
  const BottomBarState();

  @override
  List<Object> get props => [];
}

class BottomBarInitial extends BottomBarState {}

class BottomBarLoading extends BottomBarState {}

class BottomBarLoaded extends BottomBarState {}

class BottomBarError extends BottomBarState {}
