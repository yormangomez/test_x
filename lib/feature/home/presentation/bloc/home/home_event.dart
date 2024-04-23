part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeIndexEvent extends HomeEvent {
  const HomeIndexEvent({
    required this.index,
  });
  final int index;

  @override
  List<Object> get props => [index];
}
