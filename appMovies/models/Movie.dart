import 'dart:convert';

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double? voteAverage;
  late final double voteCount;

  String? heroId;

  Movie.fromJson(Map<String, dynamic> json){
    adult = json['adult'] == null ? false : json['adult'];
    backdropPath = '';
    // genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'] == null ? -1 : json['id'];

    originalLanguage =
    json['original_language'] == null ? '' : json['original_language'];
    originalTitle =
    json['original_title'] == null ? '' : json['original_title'];
    overview = json['overview'] == null ? '' : json['overview'];
    popularity = json['popularity'].toDouble();
    posterPath = json['poster_path'] == null ? '' : json['poster_path'];
    releaseDate = json['release_date'] == null ? '' : json['release_date'];
    title = json['title'] == null ? '' : json['title'];
    video = json['video'] == null ? false : json['video'];
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
  get fullPosterImg {
    //https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
    if (posterPath == null || posterPath.length<=5)
      return "https://image.tmdb.org/t/p/w500/3OIQMXttT2h3nvvD0RnJlJhqIZC.jpg";
    return "https://image.tmdb.org/t/p/w500${this.posterPath}";
  }
  get fullImgBg {
    //https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
    if (backdropPath == null || backdropPath.length<=5)
      return "https://image.tmdb.org/t/p/w500/3OIQMXttT2h3nvvD0RnJlJhqIZC.jpg";
    return "https://image.tmdb.org/t/p/w500${this.backdropPath}";
  }

}


