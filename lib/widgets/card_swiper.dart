import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/anime.dart';

class CardSwiper extends StatelessWidget {
  final List<Anime> animes;
  const CardSwiper({Key? key, required this.animes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Comprobación de si la lista está vacía o no, si está vacía muestra un cargando
    // hasta que la lista esté cargada.
    if (animes.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
        width: double.infinity,
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final anime = animes[index];
            print(anime.images['jpg']?.largeImageUrl);
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: anime),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/Loading_icon.gif'),
                    image: NetworkImage(anime.fullImagesPath),
                    placeholderFit: BoxFit.contain,
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
