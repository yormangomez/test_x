import 'package:dartz/dartz.dart';
import 'package:test_x/core/errors/exceptions.dart';

import 'package:test_x/core/errors/failure.dart';
import 'package:test_x/feature/home/data/datasources/cat_datasource.dart';
import 'package:test_x/feature/home/data/model/cat_image_model.dart';
import 'package:test_x/feature/home/data/model/cat_model.dart';

abstract class CatRepository {
  Future<Either<Failure, List<CatModel>>> getCat();

  Future<Either<Failure, List<CatImageModel>>> getCatImage(
      {required String id});
}

class CatRepositoryImpl extends CatRepository {
  final CatDataSource catDatasource;

  CatRepositoryImpl({required this.catDatasource});

  @override
  Future<Either<Failure, List<CatModel>>> getCat() async {
    try {
      final cat = await catDatasource.getCat();

      return Right(cat);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<CatImageModel>>> getCatImage(
      {required String id}) async {
    try {
      final cat = await catDatasource.getCatImage(id: id);

      return Right(cat);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
