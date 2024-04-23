import 'package:dartz/dartz.dart';
import 'package:test_x/core/errors/failure.dart';

import 'package:test_x/core/usecases/use_cases.dart';
import 'package:test_x/feature/home/data/repositories/cat_repository.dart';

class GetCatParams {
  String id;
  GetCatParams({
    required this.id,
  });
}

class GetCatUseCases extends UseCase<dynamic, GetCatParams> {
  final CatRepository repository;
  GetCatUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(GetCatParams params) async {
    return await repository.getCatImage(id: params.id);
  }
}
