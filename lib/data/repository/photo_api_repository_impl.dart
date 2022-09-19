import 'package:clean_image_search_app/data/data_source/pixabay_api.dart';
import 'package:clean_image_search_app/domain/model/photo.dart';
import 'package:clean_image_search_app/domain/repository/photo_api_repository.dart';

import '../data_source/result.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}