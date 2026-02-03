import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Anime serie = ModalRoute.of(context)?.settings.arguments as Anime;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(anime: serie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(anime: serie),
                _Overview(anime: serie),
                CastingCards(
                  idAnime: serie.malId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Anime anime;
  const _CustomAppBar({required this.anime});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          // Aplicamos un degradado para que el texto blanco sea legible
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1.0], // Empieza a oscurecer casi al final
              colors: [
                Colors.transparent,
                Colors.black54, // Sombra suave en la base
              ],
            ),
          ),
          child: Text(
            anime.title,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white, // El blanco es el mejor color para esto
                shadows: [
                  Shadow(
                      offset: Offset(0, 1), blurRadius: 3, color: Colors.black)
                ]),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(anime.fullImagesPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {
  final Anime anime;
  const _PosterAndTitile({required this.anime});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(anime.fullImagesPath),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          // Usamos Expanded para que el texto no se desborde
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(anime.title,
                    style: textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text(anime.titleJapanese,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('${anime.score}',
                        style: textTheme.bodySmall), // Nota real
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

class _Overview extends StatelessWidget {
  final Anime anime;

  const _Overview({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        anime
            .synopsis, // Asi es como se llama el campo overview en api.jikan.moe
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
