import 'package:flutter/material.dart';
import 'package:movies_app/models/character.dart';
import 'package:movies_app/providers/anime_providers.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int idAnime;

  const CastingCards({super.key, required this.idAnime});

  @override
  Widget build(BuildContext context) {
    final animeProvider = Provider.of<AnimeProvider>(context, listen: false);

    return FutureBuilder(
      future: animeProvider.getCharacters(idAnime),
      builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final personajes = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 190,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: personajes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  _CastCard(personajes[index])),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Datum personaje;

  const _CastCard(this.personaje);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/Loading_icon.gif'),
              image: NetworkImage(personaje.character.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            personaje.character.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
