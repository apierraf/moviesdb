class EnvironmentoConfig {
  //configure api key movieDB
  static const api_key = String.fromEnvironment('',
      defaultValue: '5d33a46257698497aa492e549a9a5589');

  //base url movieDB
  static const String base_url = 'https://api.themoviedb.org/3/movie/';

  //url image movieDb
  static const String image_url = 'https://image.tmdb.org/t/p/original/';
}
