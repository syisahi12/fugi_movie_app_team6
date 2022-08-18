class Movies {
  final int id;
  final String title;
  final String releaseDate;
  final String avgRating;
  final String imageUrl;
  final bool isFavorite;

  Movies({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.avgRating,
    required this.imageUrl,
    required this.isFavorite,
  });
}

final List<Movies> listMovies = [
  Movies(
    id: 1,
    title: 'Endgame Movies',
    releaseDate: '2022-10-18',
    avgRating: '9.8',
    imageUrl: 'assets/images/endgame.png',
    isFavorite: true,
  ),
  Movies(
    id: 2,
    title: 'Spiderman Movies',
    releaseDate: '2022-10-18',
    avgRating: '9.8',
    imageUrl: 'assets/images/spiderman.png',
    isFavorite: false,
  ),
  Movies(
    id: 3,
    title: 'Endgame Thor Movies',
    releaseDate: '2022-09-21',
    avgRating: '9.8',
    imageUrl: 'assets/images/endgame.png',
    isFavorite: false,
  ),
  Movies(
    id: 4,
    title: 'Spiderman Reborn Movies',
    releaseDate: '2022-11-12',
    avgRating: '9.8',
    imageUrl: 'assets/images/spiderman.png',
    isFavorite: true,
  ),
  Movies(
    id: 5,
    title: 'Endgame Return Movies',
    releaseDate: '2022-07-06',
    avgRating: '9.6',
    imageUrl: 'assets/images/endgame.png',
    isFavorite: false,
  ),
  Movies(
    id: 6,
    title: 'Spiderman World Movies',
    releaseDate: '2022-11-21',
    avgRating: '9.3',
    imageUrl: 'assets/images/spiderman.png',
    isFavorite: false,
  ),
];
