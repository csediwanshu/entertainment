class MoviesDetail {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String url;

  MoviesDetail({this.title, this.year, this.rated, this.released, this.runtime, this.genre, this.director, this.writer, this.actors, this.plot, this.language, this.country, this.awards, this.poster,this.url});

  MoviesDetail.fromJson(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        year = parsedJson['year'],
        rated = parsedJson['rated'],
        released = parsedJson['released'],
        runtime = parsedJson['runtime'],
        genre = parsedJson['genre'],
        director = parsedJson['director'],
        writer = parsedJson['writer'],
        actors = parsedJson['actors'],
        plot = parsedJson['plot'],
        language = parsedJson['language'],
        country = parsedJson['country'],
        awards = parsedJson['awards'],
        poster = parsedJson['poster'],
        url = parsedJson['url'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "year": year,
      "rated": rated,
      "released": released,
      "runtime": runtime,
      "genre": genre,
      "director": director,
      "writer": writer,
      "actors": actors,
      "plot": plot,
      "language": language,
      "country": country,
      "awards": awards,
      "poster": poster,
      "url" : url,
    }; 
  }
}
