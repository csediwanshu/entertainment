class SongsDetail {
  final String genre;
  final String name;
  final String rating;
  final String releasedate;
  final String singer;
  final String url;
  final String writer;
  
  
  SongsDetail({this.genre, this.name, this.rating, this.releasedate, this.singer, this.url, this.writer});


  SongsDetail.fromJson(Map<String, dynamic> parsedJson)
      : genre = parsedJson['genre'],
        name = parsedJson['name'],
        rating = parsedJson['rating'],
        releasedate = parsedJson['releasedate'],
        singer = parsedJson['singer'],
        url = parsedJson['url'],
        writer = parsedJson['writer'];
        

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "genre": genre,
      "name": name,
      "rating": rating,
      "releasedate": releasedate,
      "singer": singer,
      "url": url,
      "writer": writer
     
    };
  }
}
