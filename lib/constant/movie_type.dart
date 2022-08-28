enum MovieType {now_playing, popular, top_rated, upcoming}

extension MovieTypeExtention on MovieType {
  String get name {
    switch (this) {
      case MovieType.now_playing:
        return 'Now Playing';
      case MovieType.popular:
        return 'Popular';
      case MovieType.top_rated:
        return 'Top Rated';
      case MovieType.upcoming:
        return 'Upcoming';
      default:
        return 'Now Playing';
    }
  }

  String get nameType {
    switch (this) {
      case MovieType.now_playing:
        return 'now_playing';
      case MovieType.popular:
        return 'popular';
      case MovieType.top_rated:
        return 'top_rated';
      case MovieType.upcoming:
        return 'upcoming';
      default:
        return 'now_playing';
    }
  }

  int get id {
    switch (this) {
      case MovieType.now_playing:
        return 0;
      case MovieType.popular:
        return 1;
      case MovieType.top_rated:
        return 2;
      case MovieType.upcoming:
        return 3;
      default:
        return 0;
    }
  }
}
