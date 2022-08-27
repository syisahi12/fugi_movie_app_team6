import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/constant/movie_type.dart';

class MovieCategories extends ConsumerWidget {
  const MovieCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final MovieType _data = ref.read(movieTypeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: MovieType.values
          .map((type) => Text(
                type.name,
                style: const TextStyle(color: Colors.red, fontSize: 24),
              ))
          .toList(),
    );
  }
}
