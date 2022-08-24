class Config {
  static const baseUrl = String.fromEnvironment('baseUrl',
      defaultValue: 'https://api.themoviedb.org/3/');
  static const imageBaseUrl = String.fromEnvironment('imageBaseUrl',
      defaultValue: 'https://image.tmdb.org/t/p/');
  static const apiKey = String.fromEnvironment('apiKey',
      defaultValue: 'ebd2cdfaaa90ae5ce496bc143d03cdc4');
  static const apiToken = String.fromEnvironment('apiToken',
      defaultValue:
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYmQyY2RmYWFhOTBhZTVjZTQ5NmJjMTQzZDAzY2RjNCIsInN1YiI6IjYyZjljNWRmMTc1MDUxMDA3ZjkwYTM5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mnobbSNFPZlk2ZdKGzQeM1BIghIg7a4_hPDEPnUk6aM');
}
