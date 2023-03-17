class EnvironmentoConfig {
  //configure api key movieDB
  static const apiKey = String.fromEnvironment('',
      defaultValue: '5d33a46257698497aa492e549a9a5589');

  //base url movieDB
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';

  //url image movieDb
  static const String imageUrl = 'https://image.tmdb.org/t/p/original/';
}
