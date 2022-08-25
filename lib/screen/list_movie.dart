import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:intl/intl.dart';

import '../provider/movie_provider.dart';

class ListMovie extends ConsumerWidget {
  final String title;

  const ListMovie({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(movieProvide(title));
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        title: Text(title),
      ),
      body: _data.when(
        data: (_data) {
          return ListView(
            children: [
              ..._data.map((e) => ListView(
                shrinkWrap: true,
                children: [_buildCard(e, context)],
              ))
            ],
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
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 9),
      child: Row(children: [
        SizedBox(
          height: 120,
          width: 95,
          child: InkWell(
            onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => MovieDetail(movies),
              //   ));
            },
            // child: Image.asset(movies.imageUrl, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 22),
        Expanded(
          child: SizedBox(
            height: 120,
            width: 95,
            child: InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => MovieDetail(movies),
                // ));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title:\n${movieModel.title}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Release Date:\n${ movieModel.releaseDate}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                    const SizedBox(height: 5),
                     Text(
                      'Average Rating:\n${ movieModel.voteAverage.toString()}',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kFouthColor),
                    ),
                  ]),
            ),
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
    );
  }
}
