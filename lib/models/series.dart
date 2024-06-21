class Series {
  String name;
  String originalName;
  String overview;
  String posterPath;
  String backdropPath;
  String releaseDate;
  double rate;

  Series({
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.rate,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      name: json["name"],
      originalName: json["original_name"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      backdropPath: json["backdrop_path"],
      releaseDate: json["first_air_date"],
      rate: json["vote_average"],
    );
  }
}
