import 'package:chili_app/models/models.dart';
import 'package:dio/dio.dart';
import 'package:chili_app/repository/repository.dart';

class GifsRepository extends AbstractGifsRepository {
  GifsRepository({
    required this.dio,
  });

  final Dio dio;
  final String baseUrl =
      "https://api.giphy.com/v1/gifs/trending?api_key=SizA2JnMQs1kw7HNgcj4hmBFXZKmVvGZ&limit=20&rating=g";

  @override
  Future<List<GifsModel>> getGifs({
    String searching = "",
    int landslide = 0,
  }) async {
    final Response response;
    final String secondUrel =
        "https://api.giphy.com/v1/gifs/search?api_key=SizA2JnMQs1kw7HNgcj4hmBFXZKmVvGZ&q=$searching&limit=19&offset=$landslide&rating=g&lang=en";

    if (searching == '') {
      response = await dio.get(baseUrl);
    } else {
      response = await dio.get(secondUrel);
    }

    final responseData = response.data as Map<String, dynamic>;
    final List data = responseData["data"];

    List<GifsModel> gifsUrl = [];
    for (int i = 0; i < data.length; i++) {
      final gifsMap = data[i] as Map<String, dynamic>;
      final gifsImages = gifsMap["images"] as Map<String, dynamic>;
      final gifsHeight = gifsImages["fixed_height"] as Map<String, dynamic>;
      gifsUrl.add(GifsModel.fromJson(gifsHeight));
    }

    return gifsUrl;
  }
}
