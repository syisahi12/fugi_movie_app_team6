import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/data/movies.dart';
import 'package:fugi_movie_app_team6/screen/detail/movie_detail.dart';
import 'package:fugi_movie_app_team6/screen/detail/widgets/build_bottom.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 18, bottom: 9, left: 20, right: 15),
              height: 125,
              color: kBackground,
              alignment: Alignment.bottomLeft,
              child: Text(
                'Movie DB App',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  top: 18, bottom: 9, left: 20, right: 15),
              height: 60,
              color: kBackground,
              alignment: Alignment.topLeft,
              child: Text(
                'Your Watch List',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _buildCard(listMovies[index], context);
                },
                itemCount: listMovies.length,
              ),
            ),
            BuildBottom(
              ini: true,
            ), // const Spacer(),
          ],
        ));
  }

  Widget _buildCard(Movies movies, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 9, left: 20, right: 15),
      child: Row(children: [
        SizedBox(
          height: 120,
          width: 95,
          child: InkWell(
            onTap: () {},
            child: Image.asset(movies.imageUrl, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 22),
        Expanded(
          child: SizedBox(
            height: 120,
            width: 95,
            child: InkWell(
              onTap: () {},
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title:\n${movies.title}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Release Date:\n${movies.releaseDate}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Average Rating:',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kFouthColor),
                    ),
                    Text(
                      movies.avgRating,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kFouthColor),
                    ),
                  ]),
            ),
          ),
        ),
        SizedBox(
          height: 120,
          width: 70,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            movies.isFavorite == true
                ? Icon(Icons.bookmark, color: kPrimaryColor)
                : Icon(Icons.bookmark, color: kFouthColor),
            const SizedBox(height: 19),
            Spacer(),
            Text(
              'Readmore',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
            )
          ]),
        ),
      ]),
    );
  }
}
