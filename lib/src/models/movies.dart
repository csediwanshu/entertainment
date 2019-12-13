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
        poster = parsedJson['poster'];

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
    };
  }
}
