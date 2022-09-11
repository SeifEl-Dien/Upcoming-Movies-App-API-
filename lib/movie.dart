class Movie {
  int? id;
  String? title;
  double? voteaverage;
  String? releasedate;
  String? overview;
  String? posterpath;
  Movie(this.id, this.title, this.voteaverage, this.releasedate, this.overview,
      this.posterpath);
  Movie.fromjson(Map<String, dynamic> parsedjson) {
    this.id = parsedjson['id'];
    this.title = parsedjson['title'];
    this.voteaverage = parsedjson['vote_average'] * 1.0;
    this.releasedate = parsedjson['release_date'];
    this.overview = parsedjson['overview'];
    this.posterpath = parsedjson['poster_path'];
  }
}
