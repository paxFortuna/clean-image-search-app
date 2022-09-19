import 'package:clean_image_search_app/domain/model/photo.dart';

import '../../data/data_source/result.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}