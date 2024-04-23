import 'package:test_x/feature/home/data/model/cat_image_model.dart';
import 'package:test_x/feature/home/data/model/cat_model.dart';

abstract class CatDataSource {
  Future<List<CatModel>> getCat();

  Future<List<CatImageModel>> getCatImage({required String id});
}
