// ignore_for_file: must_be_immutable

part of 'cat_bloc.dart';

class CatState extends Equatable {
  CatState({
    this.listCat,
    this.listImageCat,
  });

  List<CatModel>? listCat;
  List<CatImageModel>? listImageCat;

  @override
  List<Object?> get props => [
        listCat,
        listImageCat,
      ];

  CatState copyWith({
    List<CatModel>? listCat,
    List<CatImageModel>? listImageCat,
  }) {
    return CatState(
      listCat: listCat ?? this.listCat,
      listImageCat: listImageCat ?? this.listImageCat,
    );
  }
}
