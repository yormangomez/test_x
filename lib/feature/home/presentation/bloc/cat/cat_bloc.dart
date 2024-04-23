import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_x/feature/home/data/model/cat_image_model.dart';
import 'package:test_x/feature/home/data/model/cat_model.dart';
import 'package:test_x/feature/home/domain/usecases/cat_usecases.dart';
import 'package:test_x/feature/home/domain/usecases/get_cat_usecases.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatUseCases catUseCases;

  CatBloc({required this.catUseCases}) : super(CatState()) {
    on<CatEvent>((event, emit) {});

    on<GetCatEvent>((event, emit) async {
      final result = await catUseCases.repository.getCat();

      result.fold((l) => null, (r) => emit(state.copyWith(listCat: r)));
    });

    on<GetCatImageEvent>((event, emit) async {
      final result = await catUseCases.repository.getCatImage(
        id: event.id,
      );

      result.fold((l) => null, (r) => emit(state.copyWith(listImageCat: r)));
    });
  }
}
