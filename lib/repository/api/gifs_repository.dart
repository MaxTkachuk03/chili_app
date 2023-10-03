import 'package:dio/dio.dart';

import 'package:chili_app/models/gifs_model.dart';
import 'package:chili_app/repository/repository.dart';
import 'package:flutter/material.dart';

class GifsRepository extends AbstractGifsRepository {
  GifsRepository({
    required this.dio,
  });

  final Dio dio;
  final String baseUrl =
      "https://api.giphy.com/v1/gifs/trending?api_key=SizA2JnMQs1kw7HNgcj4hmBFXZKmVvGZ&limit=20&rating=g";

  @override
  Future<List<GifsModel>> getGifs(String searching, int landslide) async {
    final Response response;
    final String secondUrel =
        "https://api.giphy.com/v1/gifs/search?api_key=SizA2JnMQs1kw7HNgcj4hmBFXZKmVvGZ&q=$searching&limit=19&offset=$landslide&rating=g&lang=en";

    if (searching == '') {
      response = await dio.get(baseUrl);
    } else {
      response = await dio.get(secondUrel);
    }
    // final responseData = _fetchGifs(response);
    // return responseData;

    final responseData = response.data; // as Map<String, dynamic>;
    final data = responseData["data"];
    final gifsImages = data[17] as Map<String, dynamic>;
    final gifsHeight = gifsImages[6] as Map<String, dynamic>;
    final gifs = gifsHeight.entries.map((value) {
      final gifsData =
          (value.value as Map<String, dynamic>)[3] as Map<String, dynamic>;
      final gifsUrl = GifsModel.fromJson(gifsData);
      return GifsModel(
        url: gifsUrl.url,
      );
    }).toList();
    return gifs;
    // // final gifs = data.entries.map((value) {
    // //   final responseData =
    // //       (value.value as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    // //   final gifsData = GifsModel.fromJson(responseData);
    // //   return GifsModel(
    // //     images: gifsData.images,
    // //     fixedHeight: gifsData.fixedHeight,
    // //     url: gifsData.url,
    // //   );
    // // }).toList();
    // debugPrint(responseData.toString());
  }

  // List<GifsModel> _fetchGifs(Response<dynamic> response) {

  //   // final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
  //   //   response.data['data'],
  //   // );
  //   // final responseData = data.map((e) => GifsModel.fromJson(e)).toList();
  //   return responseData;
  // }
}
