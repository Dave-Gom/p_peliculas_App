import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';

class MovieSlidershow extends StatelessWidget {
  final List<Movie> movies;

  const MovieSlidershow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        autoplay: true,
        itemBuilder: (context, index) => _Slide(
          movie: movies[index],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 10),
          )
        ]);

    return Padding(
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }

                  return FadeIn(child: child);
                },
              ))),
    );
  }
}
