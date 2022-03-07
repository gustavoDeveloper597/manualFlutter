import 'package:flutter/material.dart';
import 'package:repaso_app/appMovies/models/Movie.dart';

class MovieSlider extends StatefulWidget {
  List<Movie> movies;
  String title;
  Function nextPage;

  MovieSlider({required this.movies, required this.title,required this.nextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  ScrollController scrollCtrl = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollCtrl.addListener(() {
      // print(scrollCtrl.position.pixels);
      // print(scrollCtrl.position.maxScrollExtent);
      if(scrollCtrl.position.pixels >= scrollCtrl.position.maxScrollExtent-10){
        widget.nextPage();
      }
    });
  }

  @override
  void dispose() {
    //destruye
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: 350,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // TODO: implement build
    return Container(
      // padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 350,
      // color: Colors.orange,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            this.widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: scrollCtrl,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              return MoviePoster(movie: widget.movies[index]);
            },
          ),
        )
      ]),
    );
  }
}

class MoviePoster extends StatelessWidget {
  Movie movie;

  MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    movie.heroId='slider-${movie.id}';
    return Container(
      width: 130,
      height: 170,
      // color: Colors.purple,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'DetailsScreen',arguments: movie);
            },
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage("assets/img/no-image.jpg"),
                    image: NetworkImage(movie.fullPosterImg)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
