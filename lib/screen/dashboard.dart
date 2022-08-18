import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/data/movies.dart';
import 'package:fugi_movie_app_team6/screen/movie_detail.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackground,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _buildCard(listMovies[index], context);
        },
        itemCount: listMovies.length,
      ),
    );
  }

  Widget _buildCard(Movies movies, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 9),
      child: Row(children: [
        SizedBox(
          height: 120,
          width: 95,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MovieDetail(),
              ));
            },
            child: Image.asset(movies.imageUrl, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 22),
        Expanded(
          child: SizedBox(
            height: 120,
            width: 95,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        SizedBox(
          height: 120,
          width: 30,
          child: Column(children: [
            movies.isFavorite == true
                ? Image.asset('assets/images/vector.png', color: kPrimaryColor)
                : Image.asset('assets/images/vector.png', color: kFouthColor),
            const SizedBox(height: 19),
            movies.isFavorite == true
                ? Image.asset('assets/images/vector_star.png',
                    color: kPrimaryColor)
                : Image.asset('assets/images/vector_star.png', color: kFouthColor)
          ]),
        ),
      ]),
    );
  }
}
