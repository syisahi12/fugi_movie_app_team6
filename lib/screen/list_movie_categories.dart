import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/screen/detail/movie_detail.dart';

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
              return Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 9),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetail(_data[index])));
                  },
                  child: Row(children: [
                    Container(
                      height: 120,
                      width: 95,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(_data[index].posterPathUrl),
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
                                'Title:\n${_data[index].title}',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: kFouthColor),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Release Date:\n${_data[index].releaseDate}',
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: kFouthColor),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Average Rating:\n${_data[index].voteAverage.toString()}',
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
                        _data[index].adult == true
                            ? const Icon(Icons.bookmark, color: kPrimaryColor)
                            : const Icon(Icons.bookmark, color: kFouthColor),
                        const SizedBox(height: 19),
                        _data[index].adult == true
                            ? const Icon(Icons.star_outlined,
                                color: kPrimaryColor)
                            : const Icon(Icons.star_outlined,
                                color: kFouthColor)
                      ]),
                    ),
                  ]),
                ),
              );
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
}
