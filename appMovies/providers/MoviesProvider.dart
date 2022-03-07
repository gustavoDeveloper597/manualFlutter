import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:repaso_app/appMovies/helpers/Debouncer.dart';

import 'package:repaso_app/appMovies/models/CreditsResponse.dart';
import 'package:repaso_app/appMovies/models/Movie.dart';
import 'package:repaso_app/appMovies/models/NowPlayingResponse.dart';
import 'package:repaso_app/appMovies/models/PopularResponse.dart';
import 'package:repaso_app/appMovies/models/SearchMovieResponse.dart';

class MoviesProvider extends ChangeNotifier {
  String baseUrl = 'api.themoviedb.org';
  String apiKey = 'f90cc36d4ef4fc826d0fa58c9fa0033e';
  String language = 'es-ES';
  int count_popular = 1;
  bool is_loading_popular = false;

  List<Movie> NowMovies = [];
  List<Movie> PopularMovies = [];
  Map<String, List> movieCast = {};

  Debouncer debouncer=Debouncer(duration: Duration(milliseconds: 500),);

  StreamController<List<Movie>> streamCtrlSuggestion=new StreamController.broadcast();
  Stream<List<Movie>> get sugerenciasStream=>this.streamCtrlSuggestion.stream;

  MoviesProvider() {
    print("Inicializado movies provider");
    this.getOnDisplayMovies();
    this.getOnDisplayPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(baseUrl, '/3/movie/now_playing',
        {'api_key': apiKey, 'language': language, 'page': '1'});
    var response = await http.get(url);
    // final decodeData=json.decode(response.body) as Map<String,dynamic>;
    final nowPlayingResponse =
        NowPlayingResponse.fromJson(convert.jsonDecode(response.body));
    // print(nowPlayingResponse.results[0].title);
    this.NowMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getOnDisplayPopularMovies() async {
    //https://quicktype.io/
    if (is_loading_popular) {
      print("Evita recargar");
      return;
    }

    var url = Uri.https(baseUrl, '/3/movie/popular', {
      'api_key': apiKey,
      'language': language,
      'page': count_popular.toString()
    });
    is_loading_popular = true;
    var response = await http.get(url);
    // final decodeData=json.decode(response.body) as Map<String,dynamic>;
    // print(decodeData);
    final popularResponse = PopularResponse.fromJson(convert.jsonDecode(response.body));
    this.PopularMovies = [...PopularMovies, ...popularResponse.results];
    notifyListeners();
    count_popular++;
    is_loading_popular = false;
  }

  Future<List> getMovieCast(int id) async {
    var url = Uri.https(baseUrl, '/3/movie/${id}/credits', {
      'api_key': apiKey,
      'language': language,
      // 'page': count_popular.toString()
    });

    var response = await http.get(url);

    if (movieCast.containsKey(id.toString())) {
      return movieCast[id.toString()]!;
    }
    var responseCast =
        CreditsResponse.fromJson(convert.jsonDecode(response.body));
    List<Cast> actores = responseCast.cast;
    movieCast[id.toString()] = actores;
    return actores;
  }

  Future<List<Movie>> searchMovie(String query) async {
    var url = Uri.https(baseUrl, '/3/search/movie', {
      'api_key': apiKey,
      'language': language,
      // 'page': count_popular.toString(),
      'query': query
    });
    var response = await http.get(url);
    try {
      var responsePeliculas =
          SearchMovieResponse.fromJson(convert.jsonDecode(response.body));
      return responsePeliculas.results;
    } catch (e) {
      print('error ${e}');
    }
    return [];
  }
  getSUgerenciasByQUery(String query){
    debouncer.value='';
    debouncer.onValue=(valor)async {
      print("tenemos valor ${query}");
      final result=await searchMovie(query);
      this.streamCtrlSuggestion.add(result);
    };
    Timer timer=Timer.periodic(Duration(milliseconds: 300), (timer) {
      debouncer.value=query;
    });
    Future.delayed(Duration(milliseconds: 301)).then((value) => timer.cancel());
  }

}
