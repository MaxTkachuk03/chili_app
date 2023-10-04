import 'package:chili_app/models/models.dart';

abstract class AbstractGifsRepository {
  Future<List<GifsModel>> getGifs({
    String searching,
    int landslide,
  });
}
