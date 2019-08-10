
class MovieData {
  Rating rating;
  List<String>genres;
  String title;
  List<Cast> casts;
  String castsStr;
  int collectCount;
  List<Cast> directors;
  String directorsStr;
  Avatars imageUrls;
  String id;

  MovieData();

  factory MovieData.fromJson(Map<String,dynamic> movieDataJson){
    MovieData movieData = MovieData();

    Rating rating = Rating(movieDataJson['rating']['max'], double.parse(movieDataJson['rating']['average'].toString()), movieDataJson['rating']['min']);
    movieData.rating = rating;

    List<String> genres = new List();
    for (String genre in movieDataJson['genres']) {
      genres.add(genre);
    }
    movieData.genres = genres;

    movieData.title = movieDataJson['title'];

    List<Cast> casts = new List();
    for (dynamic castData in movieDataJson['casts']) {
      dynamic avatarsData = castData['avatars'];
      Avatars avatars;
      if (avatarsData != null) {
        avatars = Avatars(castData['avatars']['small'], castData['avatars']['medium'], castData['avatars']['large']);
      }else{
        avatars = null;
      }
      
      Cast cast = new Cast(castData['alt'], avatars, castData['name'], castData['id']);
      casts.add(cast);
    }
    movieData.casts = casts;
    String castsStr = '';
    int castCount = 0;
    for (Cast cast in movieData.casts) {
      if (castCount == 0) {
        castsStr = cast.name;
        castCount ++;
      }else{
        castsStr += (" / " + cast.name);
      }
    }
    movieData.castsStr = castsStr;

    movieData.collectCount = movieDataJson['collect_count'];
    
    List<Cast> directors = new List();
    for (dynamic castData in movieDataJson['directors']) {
      dynamic avatarsJson = castData['avatars'];
      Avatars avatars;
      if (avatarsJson != null) {
        avatars = Avatars(avatarsJson['small'], avatarsJson['medium'], avatarsJson['large']);
      }else{
        avatars = null;
      }
      Cast cast = new Cast(castData['alt'], avatars, castData['name'], castData['id']);
      directors.add(cast); 
    }
    movieData.directors = directors;
    String directorsStr = '';
    for (Cast cast in movieData.directors) {
      directorsStr += cast.name;
    }
    movieData.directorsStr = directorsStr;

    movieData.imageUrls = Avatars(movieDataJson['images']['small'], movieDataJson['images']['medium'], movieDataJson['images']['large']);

    movieData.id = movieDataJson['id'];
    
    return movieData;
  }
}

class Rating {
  int max;
  double average;
  int min;

  Rating(this.max,this.average,this.min);
}

class Cast {
  String alt;
  Avatars avatars;
  String name;
  String id;

  Cast(this.alt,this.avatars,this.name,this.id);
}

class Avatars {
  String small;
  String medium;
  String large;

  Avatars(this.small,this.medium,this.large);
}