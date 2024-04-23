// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  HomeState({this.index = 0});
  int index;

  @override
  List<Object> get props => [index];
}

final class HomeInitial extends HomeState {}

class HomeIndexState extends HomeState {
  HomeIndexState({
    required this.newIndex,
  }) : super(
          index: newIndex,
        );
  final int newIndex;

  @override
  List<Object> get props => [newIndex];
}
