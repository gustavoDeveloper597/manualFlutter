import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repaso_app/appMovies/models/Movie.dart';
import 'package:repaso_app/appMovies/models/SearchMovieResponse.dart';
import 'package:repaso_app/appMovies/providers/MoviesProvider.dart';

class SearchMovieDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Buscar pelis";

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSUgerenciasByQUery(query);
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      print("A1");
      return Container(
        child: Center(
          child: Icon(
            Icons.movie_creation_outlined,
            color: Colors.red,
            size: 40,
          ),
        ),
      );
    } else {

      return StreamBuilder(
          stream: moviesProvider.sugerenciasStream,
          builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Icon(
                    Icons.movie_creation_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              );
            } else {
              var peliculas = snapshot.data!;
              return ListView.builder(
                  itemCount: peliculas.length,
                  itemBuilder: (context, index) {
                    return _SugerenciasItem(peliculas[index]);
                  });
            }
          });
    }
  }
}

class _SugerenciasItem extends StatelessWidget {
  Movie movie;

  _SugerenciasItem(this.movie);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      leading: Container(
        // width: 100,
        height: 100,

        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Hero(
            tag: movie.heroId!,
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              // width: 220,
              // height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'DetailsScreen', arguments: movie);
      },
    );
  }
}
