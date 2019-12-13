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
      : title = parsedJson['Title'],
        year = parsedJson['Year'],
        rated = parsedJson['Rated'],
        released = parsedJson['Released'],
        runtime = parsedJson['Runtime'],
        genre = parsedJson['Genre'],
        director = parsedJson['Director'],
        writer = parsedJson['Writer'],
        actors = parsedJson['Actors'],
        plot = parsedJson['Plot'],
        language = parsedJson['Language'],
        country = parsedJson['Country'],
        awards = parsedJson['Awards'],
        poster = parsedJson['Poster'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Title": title,
      "Year": year,
      "Rated": rated,
      "Released": released,
      "Runtime": runtime,
      "Genre": genre,
      "Director": director,
      "Writer": writer,
      "Actors": actors,
      "Plot": plot,
      "Language": language,
      "Country": country,
      "Awards": awards,
      "Poster": poster,
    };
  }
}
