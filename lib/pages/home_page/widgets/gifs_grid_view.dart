import 'package:chili_app/models/models.dart';
import 'package:flutter/material.dart';

class GifsGridView extends StatelessWidget {
  const GifsGridView({
    super.key,
    required this.gifs,
  });

  final List<GifsModel> gifs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: gifs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          gifs[index].url,
          height: 300,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
