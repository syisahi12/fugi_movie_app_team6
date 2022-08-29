import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/screen/movie_detail3.dart';

import '../provider/categories_movie_provider.dart';

class ListMovieCategories extends ConsumerWidget {
  final String movieType;

  const ListMovieCategories({Key? key, required this.movieType})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(categoriesMovieProvide(movieType));
    return Scaffold(
      backgroundColor: kBackground,
      body: _data.when(
        data: (_data) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildCard(_data[index], context);
            },
            itemCount: _data.length,
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildCard(MovieModel movieModel, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 9),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetail3(movieModel)));
        },
        child: Row(children: [
          Container(
            height: 120,
            width: 95,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(movieModel.posterPathUrl),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: SizedBox(
              height: 120,
              width: 95,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title:\n${movieModel.title}${movieModel.id}',
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Release Date:\n${movieModel.releaseDate}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Average Rating:\n${movieModel.voteAverage.toString()}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kFouthColor),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 120,
            width: 30,
            child: Column(children: [
              movieModel.adult == true
                  ? const Icon(Icons.bookmark, color: kPrimaryColor)
                  : const Icon(Icons.bookmark, color: kFouthColor),
              const SizedBox(height: 19),
              movieModel.adult == true
                  ? const Icon(Icons.star_outlined, color: kPrimaryColor)
                  : const Icon(Icons.star_outlined, color: kFouthColor)
            ]),
          ),
        ]),
      ),
    );
  }
}
