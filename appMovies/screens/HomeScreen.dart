import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repaso_app/appMovies/providers/MoviesProvider.dart';
import 'package:repaso_app/appMovies/search/SearchMovieDelegate.dart';
import 'package:repaso_app/appMovies/widgets/CardSwiper.dart';
import 'package:repaso_app/appMovies/widgets/MovieSlider.dart';

//
// para usar https://www.themoviedb.org/u/gustavoDeveloper
// ab1d.... y 123.....90
//f90cc36d4ef4fc826d0fa58c9fa0033e

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cine"),
        elevation: 0,
        actions: [IconButton(onPressed: () {
          showSearch(context: context, delegate: SearchMovieDelegate());
        }, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.NowMovies),
              SizedBox(
                height: 20,
              ),
              MovieSlider(
                  title: 'Populares', movies: moviesProvider.PopularMovies,nextPage: (){
                     moviesProvider.getOnDisplayPopularMovies();
              },),

            ],
          ),
        ),
      ),
    );
  }
}
