enum MovieType { latest, now_playing, popular, top_rated, upcoming }

extension MovieTypeExtention on MovieType {
  String get name {
    switch (this) {
      case MovieType.latest:
        return 'Latest';
      case MovieType.now_playing:
        return 'Now Playing';
      case MovieType.popular:
        return 'Popular';
      case MovieType.top_rated:
        return 'Top Rated';
      case MovieType.upcoming:
        return 'Upcoming';
      default:
        return 'Unknown';
    }
  }

  int get id {
    switch (this) {
      case MovieType.latest:
        return 0;
      case MovieType.now_playing:
        return 1;
      case MovieType.popular:
        return 2;
      case MovieType.top_rated:
        return 3;
      case MovieType.upcoming:
        return 4;
      default:
        return 0;
    }
  }
}
