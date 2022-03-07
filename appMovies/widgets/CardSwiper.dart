// usa un paquete externo llamado flutter_card_swipper
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:repaso_app/appMovies/models/Movie.dart';
import 'package:repaso_app/appMovies/providers/MoviesProvider.dart';

class CardSwiper extends StatelessWidget {
  List<Movie> movies;

  CardSwiper({required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * .5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * .5,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * .6,
        itemHeight: size.height * .7,
        itemBuilder: (context, index) {
          final movie = movies[index];
          print(movie.fullPosterImg);
          movie.heroId = 'swiper-${movie.id}';

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'DetailsScreen', arguments: movie);
            },
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
