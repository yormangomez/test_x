part of 'cat_bloc.dart';

sealed class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object> get props => [];
}

class GetCatEvent extends CatEvent {
  const GetCatEvent();
  @override
  List<Object> get props => [];
}

class GetCatImageEvent extends CatEvent {
  const GetCatImageEvent({
    required this.id,
  });

  final String id;
  @override
  List<Object> get props => [
        id,
      ];
}
