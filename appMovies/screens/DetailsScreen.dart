import 'package:flutter/material.dart';
import 'package:repaso_app/appMovies/models/Movie.dart';
import 'package:repaso_app/appMovies/models/SearchMovieResponse.dart';
import 'package:repaso_app/appMovies/widgets/CastingCards.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final String movie =
    // ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    var movie;

    movie = ModalRoute.of(context)!.settings.arguments as Movie;

    // TODO: implement build
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("${movie}"),
        // ),
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          movie: movie,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie: movie),
          _OverView(movie),
          CastingCards(movie.id)
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  Movie movie;

  _CustomAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            color: Colors.black12,
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 18),
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(this.movie.fullImgBg),
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  Movie movie;

  _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                // width: 80,
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(this.movie.fullPosterImg),
                height: 150,
                width: 100,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.movie.title,
                  style: theme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: theme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 15,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Votos',
                      style: theme.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  Movie movie;

  _OverView(this.movie);

  @override
  Widget build(BuildContext context) {
    print(movie.popularity);
    print(movie.voteAverage);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1),
    );
  }
}
