import 'package:dartz/dartz.dart';
import 'package:test_x/core/errors/failure.dart';

import 'package:test_x/core/usecases/use_cases.dart';
import 'package:test_x/feature/home/data/repositories/cat_repository.dart';

class CatParams {
  CatParams();
}

class CatUseCases extends UseCase<dynamic, CatParams> {
  final CatRepository repository;
  CatUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(CatParams params) async {
    return await repository.getCat();
  }
}
