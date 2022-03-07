import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repaso_app/appMovies/models/CreditsResponse.dart';

import 'package:repaso_app/appMovies/providers/MoviesProvider.dart';

class CastingCards extends StatelessWidget {
  // const CastingCards({Key? key}) : super(key: key);
  int id;

  CastingCards(this.id);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(id),
      builder: (context, AsyncSnapshot<List> snapshot) {
        final cast = snapshot.data;

        if (!snapshot.hasData) {
          return Container(
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }
        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          // color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (cast![index] != null) {
                print("------>${cast[index]}");
                return _CastCard(cast: cast[index]);
              } else {
                return SizedBox();
              }
            },
            itemCount: cast!.length,
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  Cast cast;

  _CastCard({required this.cast});

  @override
  Widget build(BuildContext context) {
    print("------------------${cast.profilePath}");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.purple,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(cast.fullPosterImg),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
